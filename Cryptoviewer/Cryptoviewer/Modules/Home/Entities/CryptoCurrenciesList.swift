//
//  CryptoCurrenciesList.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

struct CryptoCurrency: Codable{
    let currency:String
}
enum CodingKeys: String, CodingKey {
    case currency
}
