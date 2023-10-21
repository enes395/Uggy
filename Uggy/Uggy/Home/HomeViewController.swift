//
//  HomeViewController.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 11.10.2023.
//

import UIKit
import Kingfisher
import Alamofire
class HomeViewController: UIViewController {
    
//    let networkManager = FoodManager.shared



    let viewModel = HomeViewModel()
    @IBOutlet weak var yeniCollectionView: UICollectionView!
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllFood()
        
        configureCollectionView()

//        yeniCollectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "foodCellView")
//        let nib = UINib(nibName: "foodCellView", bundle: .main)
//        yeniCollectionView.register(nib, forCellWithReuseIdentifier: "foodCellView")
        
//        yeniCollectionView.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "foodCellView")
        
    }
    
    
    
    func configureCollectionView() {
        yeniCollectionView.delegate = self
        yeniCollectionView.dataSource = self
        
        let nib = UINib(nibName: "FoodCollectionViewCell", bundle: Bundle(for: FoodCollectionViewCell.self))
        yeniCollectionView.register(nib, forCellWithReuseIdentifier: "foodCellView")

    }
    
    func fetchAllFood() {
        getAllFood { [weak self ] result in
            switch result {
            case .success(let foodsResponse):
                self?.viewModel.foods = foodsResponse.yemekler
                // UI işlemleri mainde yapılır
                DispatchQueue.main.async {
                    self?.yeniCollectionView.reloadData()

                }
                print("Yemekler: \(foodsResponse.yemekler)")
            case .failure(let error):
                print("Hata: \(error)")
            }
        }

        
    }
    
    
    
}
extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.foods.count
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 144, height: 180)
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let food = viewModel.foods[indexPath.item]
        
//        let food = foods[indexPath.item]
        guard let yemekAdi = food.yemek_adi else {
                return UICollectionViewCell() // veya yemek_adi nil ise nasıl işlem yapmanız gerektiğine karar verin
            }
        
        let cell = yeniCollectionView.dequeueReusableCell(withReuseIdentifier: "foodCellView", for: indexPath) as! FoodCollectionViewCell
//                guard let yemekAdi = food.yemek_adi else  {return cell}
//        cell.foodNameLabel.text = yemekAdi
//        cell.foodNameLabel.text = food.yemek_adi
        
//        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
//            DispatchQueue.main.async {
//                cell.foodImageView.kf.setImage(with: url)
//            }
//        }
        cell.configureCell(food:food)
        return cell
        
        //        cell.yemekResimImageView.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!) )"),placeholder: nil,options: [.transition(.fade(0.7))])
    }
    
}
    
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let selectedFood = viewModel.foods[indexPath.item]
//        let viewModel = DetailViewModel(food: selectedFood)

        let detailVC = DetailViewController(food: selectedFood)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension HomeViewController : FoodResponseProtocol {
    func foodSuccess(foods: [Foods]) {
        self.viewModel.foods = foods
        yeniCollectionView.reloadData()
    }
    func foodListFail(error: String) {
        print(error)
    }
}


//protocol PokemonResponseProtocol: AnyObject {
//    func pokemonListSuccess(pokemonList: [Pokemon])
//    func pokemonListFail(error: String)
//}
//
//class PokemonListViewModel {
//
//    // MARK: - Variables
//
//    private let networkManager = NetworkManager()
//
//    var pokemonList: [Pokemon] = []
//    weak var delegate: PokemonResponseProtocol?
//
//    // MARK: - Fetch All Pokemon
//
//    func fetchAllPokemon() {
//        networkManager.request(router: .getPokemonList) { [weak self] (result: Result<PokemonListModel, Error>) in
//            switch result {
//            case .success(let pokemonList):
//                self?.delegate?.pokemonListSuccess(pokemonList: pokemonList.results)
//            case .failure(let error):
//                self?.delegate?.pokemonListFail(error: error.localizedDescription)
//            }
//        }
//    }
//
//}
