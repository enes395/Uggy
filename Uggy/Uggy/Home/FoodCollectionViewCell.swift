//
//  FoodCollectionViewCell.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 13.10.2023.
//

import UIKit
import Kingfisher
class FoodCollectionViewCell: UICollectionViewCell {
    
    
        var food: Foods?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    
    //    func configureCell(food: [Foods]) {
    //            foodNameLabel.text = food.yemek_adi
    //
    //            if let imageURL = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)") {
    //                DispatchQueue.main.async {
    //                    self.foodImageView.kf.setImage(with: imageURL)
    //                }
    //            }
    //        }
    //    func configureCell(food: Foods) {
    //            foodNameLabel.text = food.yemek_adi
    //
    //            if let imageURL = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi ?? "")") {
    //                DispatchQueue.main.async {
    //                    self.foodImageView.kf.setImage(with: imageURL)
    //                }
    //            }
    //        }
    //    }
    
    
    func configureCell(food: Foods) {
        foodNameLabel.text = food.yemek_adi
        
        if let imageURL = URL(string: FoodEndpoint.YemekResimleriniAlma.path + (food.yemek_resim_adi ?? "")) {
            // Kingfisher ile resmi yükle
            DispatchQueue.main.async {
                self.foodImageView.kf.setImage(with: imageURL)
            }
        }
    }
    
}
    
    
    
    

