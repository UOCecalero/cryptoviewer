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

struct ChartItemPresentation {
    var date:String?
    var price:Double?
    init(timeSpan:String, price:String) {
        self.date = timeSpan
        self.price = Double(price)
    }
}
