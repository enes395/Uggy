//
//  DetailViewController.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 14.10.2023.
//

import UIKit
import Alamofire
class DetailViewController: UIViewController {
    var food: Foods
    
    init(food: Foods) {
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let viewModel = DetailViewModel()
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detayText: UILabel!
    
    @IBAction func addFoodBasket(_ sender: Any) {
        addToCart(
            yemekAdi: food.yemek_adi ?? "",
            yemekResimAdi: food.yemek_resim_adi ?? "",
            yemekFiyat:6 ,
            yemekSiparisAdet: 2,
            kullaniciAdi: "muhammed_enes"
        ) { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print("Hata: \(error.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detayText.text = food.yemek_adi
        //        detailImage.image = UIImage(named: food.yemek_resim_adi)
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                self.detailImage.kf.setImage(with: url)
                
            }
            
            
        }
    }
    
    
    func addToCart(
        yemekAdi: String,
        yemekResimAdi: String,
        yemekFiyat: Int,
        yemekSiparisAdet: Int,
        kullaniciAdi: String,
        completionHandler: @escaping (Result<String, Error>) -> Void
    ) {
        let parameters: [String: Any] = [
            "yemek_adi": yemekAdi,
            "yemek_resim_adi": yemekResimAdi,
            "yemek_fiyat": yemekFiyat,
            "yemek_siparis_adet": yemekSiparisAdet,
            "kullanici_adi": kullaniciAdi
        ]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success:
                   
                    completionHandler(.success("Yemek sepetine eklendi"))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
    }
    
    
    
}


