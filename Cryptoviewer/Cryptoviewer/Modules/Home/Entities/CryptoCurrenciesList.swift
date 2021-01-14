//
//  CryptoCurrenciesList.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit
struct CurrencyDayData : Codable{
    let priceVariation:String
    enum CodingKeys: String, CodingKey {
        case priceVariation = "market_cap_change_pct"
    }
}

struct CryptoCurrency: Codable{
    let id:String
    let currency:String
    let symbol:String
    let price:String
    let name:String
    let logoUrl:String
    let currentDayData:CurrencyDayData
    
    enum CodingKeys: String, CodingKey {
        case id
        case currency
        case symbol
        case name
        case price
        case logoUrl = "logo_url"
        case currentDayData = "1d"
    }
}
