//
//  HomeViewModel.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 11.10.2023.
//

import UIKit


protocol FoodResponseProtocol : AnyObject {
    func foodSuccess(foods:[Foods])
    func foodListFail(error:String)
    
}
class HomeViewModel: UIViewController {
//    var pokemonList: [Pokemon] = []

    var foods : [Foods] = []
    weak var delegate: FoodResponseProtocol?

    
    
    func fetchAllFood() {
        getAllFood { [weak self ] result in
            switch result {
            case .success(let foodsResponse):
                DispatchQueue.main.async {
                    self?.delegate?.foodSuccess(foods: foodsResponse.yemekler)     // UI işlemleri mainde yapılır

                }
                print("Yemekler: \(foodsResponse.yemekler)")
            case .failure(let error):
                print("Hata: \(error)")
            }
        }

        
    }

//
//    
//    init(foods: [Foods]) {
//        self.foods = foods
//        self.filteredGenres = genres
//    }
//
//    init(genres: [GenreDatum]) {
//        self.genres = genres
//        self.filteredGenres = genres
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//
    
    
    
}
