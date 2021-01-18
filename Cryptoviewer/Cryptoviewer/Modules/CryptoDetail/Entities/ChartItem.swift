//
//  ChartItem.swift
//  Cryptoviewer
//
//  Created by alexei on 17/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit


struct ChartItemsResponse:Codable {
    
    var timestamps:[String]
    var prices:[String]
    enum CodingKeys: String, CodingKey {
        case timestamps = "timestamps"
        case prices = "prices"
    }
}

struct ChartItem {
    var date:String
    var dateFormatter:String
    var price:Double
    var priceFormatter:String
}
