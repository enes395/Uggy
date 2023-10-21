//
//  YeniNetwork.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 13.10.2023.
//

import Foundation
import Alamofire
func getAllFood(completion: @escaping (Result<FoodsResponse, Error>) -> Void) {
    let apiURL = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
    
    AF.request(apiURL, method: .get).responseData { response in
        switch response.result {
        case .success(let data):
            do {
                let foodsResponse = try JSONDecoder().decode(FoodsResponse.self, from: data)
                print(foodsResponse)
                completion(.success(foodsResponse))
            } catch {
                completion(.failure(error))
            }
        case .failure(let error):
            completion(.failure(error))

        }
    }
}
func getAllBasketFood(completion: @escaping (Result<CartFoodsResponse, Error>) -> Void) {
    let apiURL = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
    let username = "muhammed_enes"
    
    let params: Parameters = ["kullanici_adi" : username]
// veri gönderdiğimiz için post işlemini yaptık
    AF.request(apiURL, method: .post,parameters: params).responseData { response in
        switch response.result {
        case .success(let data):
            do {
                print(data)
                let cartResponse = try JSONDecoder().decode(CartFoodsResponse.self, from: data)
                completion(.success(cartResponse))
                
            } catch {
                completion(.failure(error))
            }
        case .failure(let error):
            completion(.failure(error))

        }
    }
}



