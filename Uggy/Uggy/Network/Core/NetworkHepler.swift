//
//  NetworkHepler.swift
//  Uggy
//
//  Created by Muhammed Enes Kılıçlı on 12.10.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidUrl = "invalid url"
    case generalError = "An error happened"
}

final class NetworkHelper {
    static let shared = NetworkHelper()
    
    var baseURL = "http://kasimadalan.pe.hu/yemekler/"
    
    func requestUrl(url: String) -> String {
        baseURL + url
    }
}
