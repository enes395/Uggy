//
//  FoodManager.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 12.10.2023.
//

protocol FoodManagerProtocol {
    func getAllFood(kullanici_adi: String,complete:@escaping ((FoodsResponse?,Error?)->()))//Yedir
    func addToBasket(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String,complere:@escaping ((CartFoods?,Error?)->()))
    func getFoodsFromBasket(kullanici_adi: String,complete:@escaping ((Foods?,Error?)->()))
    func deleteFoodFromBasket(sepet_yemek_id: String, kullanici_adi: String,complete:@escaping ((CartFoods?,Error?)->()))
    
//    func YemekResimleriniAlma(albumId: Int, complete: @escaping((?, Error?)->()))

    
    
}

class FoodManager:FoodManagerProtocol {
    static let shared = FoodManager()

//    func getArtists(genreId: Int, complete: @escaping ((Artists?, Error?) -> ())) {
//        NetworkManager.shared.request(type: Artists.self, url: DeezerEndpoint.genre.path + String(genreId) + "/artists", method:.get) { response in
//            switch response {
//            case .success(let data):
//                complete(data, nil)
//            case.failure(let error):
//                complete(nil, error)
//            }
//        }
//    }
    //Homepage Interactor
    func getAllFood(kullanici_adi: String, complete: @escaping ((FoodsResponse?, Error?) -> ())) {
        
        NetworkManager.shared.request(type: FoodsResponse.self, url:FoodEndpoint.TümYemekleriGetir.path , method:.get) { response in
            switch response {
            case.success(let data):
                complete(data,nil)
            case.failure(let error):
                complete(nil,error)
                
            }
        }
    }
    
    func addToBasket(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String, complere: @escaping ((CartFoods?, Error?) -> ())) {
        
    }
    
    func getFoodsFromBasket(kullanici_adi: String, complete: @escaping ((Foods?, Error?) -> ())) {
        
    }
    
    func deleteFoodFromBasket(sepet_yemek_id: String, kullanici_adi: String, complete: @escaping ((CartFoods?, Error?) -> ())) {
        
    }
    
    
    
    
    
    
}

