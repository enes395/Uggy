//
//  CartFoodsResponse1.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 11.10.2023.
//

import Foundation

struct CartFoodsResponse:Codable{
    var sepet_yemekler:[CartFoods]?
    var success:Int?
    var message:String?
}

struct CartFoods:Codable{
    var sepet_yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_siparis_adet:String?
    var kullanici_adi:String?
}

