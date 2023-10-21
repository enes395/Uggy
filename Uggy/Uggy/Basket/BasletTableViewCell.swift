//
//  BasletTableViewCell.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 14.10.2023.
//

import UIKit

class BasletTableViewCell: UITableViewCell {

    var food: CartFoods?

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var totalOrders: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(basketFood: CartFoods) {
        foodNameLabel.text = basketFood.yemek_adi
        
        
        if let imageURL = URL(string: FoodEndpoint.YemekResimleriniAlma.path + (food?.yemek_resim_adi ?? "")) {
            DispatchQueue.main.async {
                self.foodImage.kf.setImage(with: imageURL)
            }
        }
    }

    
}
