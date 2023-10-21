//
//  File.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 11.10.2023.
//

import Foundation

struct Foods : Codable {
    var yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    
    
}

struct FoodsResponse: Codable {
    var yemekler:[Foods]
    var succes:Int?
}


