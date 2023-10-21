//
//  BasketViewController.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 14.10.2023.
//

import UIKit

class BasketViewController: UIViewController {

    
    var basketFoods : [CartFoods] = []
    @IBOutlet weak var basketTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
    }
    
    func configureTableView () {
        
        basketTableView.delegate = self
        basketTableView.dataSource = self

//        let nib = UINib(nibName: "BasletTableViewCell", bundle: Bundle(for: BasletTableViewCell.self))
//        basketTableView.register(nib, forCellReuseIdentifier: "basketCell")

        basketTableView.register(BasletTableViewCell.self, forCellReuseIdentifier: "basketCell")
        
    }
    
    func fetchAllBasketFood() {
        //Escaping fonklarda kesinlikle weak self yazılmalı
        // Async işlem yapılırsa weak self yazılır,genelde escaping kullanılan fonkdur
        
        getAllBasketFood(){ [weak self] result in
            switch result {
            case .success(let basketResponse):
                self?.basketFoods = basketResponse.sepet_yemekler ?? []
                    
                // UI işlemleri mainde yapılır
                DispatchQueue.main.async {
                    self?.basketTableView.reloadData()

                }
                print("Sepet Yemekler: \(basketResponse.sepet_yemekler)")


            case .failure(let error):
                print("Hata: \(error)")
            }
        }

    }


    override func viewWillAppear(_ animated: Bool) {
        fetchAllBasketFood()
     print("adsf")
        
    }
    
    
    
}
extension BasketViewController : UITableViewDelegate {
    
    
}
extension BasketViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return basketFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = basketTableView.dequeueReusableCell(withIdentifier: "basketCell",for: indexPath) as!
        BasletTableViewCell
        
        let selectedFood = basketFoods[indexPath.row]
        cell.foodNameLabel.text = selectedFood.yemek_adi
        cell.configureCell(basketFood: selectedFood)

        return cell
    }
    
    
    
    
}
