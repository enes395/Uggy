//
//  FoodsHelper.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 12.10.2023.
//

import Foundation

enum FoodEndpoint : String {
    case TümYemekleriGetir = "tumYemekleriGetir.php"
    case SepettekiYemekleriGetir = "sepettekiYemekleriGetir.php"
    case SepeteYemekEkle = "sepeteYemekEkle.php"
    case SepettenYemekSilme = "sepettenYemekSil.php"
    case YemekResimleriniAlma = "resimler/"

    
    var path: String {
        switch self {
        case .TümYemekleriGetir:
            return NetworkHelper.shared.requestUrl(url: FoodEndpoint.TümYemekleriGetir.rawValue)
        case .SepettekiYemekleriGetir:
            return NetworkHelper.shared.requestUrl(url: FoodEndpoint.SepettekiYemekleriGetir.rawValue)
        case .SepeteYemekEkle:
            return NetworkHelper.shared.requestUrl(url: FoodEndpoint.SepeteYemekEkle.rawValue)
            
        case .SepettenYemekSilme:
            return NetworkHelper.shared.requestUrl(url: FoodEndpoint.SepettenYemekSilme.rawValue)
        case .YemekResimleriniAlma:
            return NetworkHelper.shared.requestUrl(url: FoodEndpoint.YemekResimleriniAlma.rawValue)
        }
    }
}
