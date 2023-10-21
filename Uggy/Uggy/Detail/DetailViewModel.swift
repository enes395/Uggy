//
//  DetailViewModel.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 14.10.2023.
//

import UIKit

class DetailViewModel: UIViewController {

    
    
    private let food : Foods?
        
    init(food: Foods) {
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init() {
        let defaultType = Foods(yemek_id: "",yemek_adi: "",yemek_resim_adi: "", yemek_fiyat: "")
        self.init(food:defaultType)
    }



    
    
    


    
    
    
}
