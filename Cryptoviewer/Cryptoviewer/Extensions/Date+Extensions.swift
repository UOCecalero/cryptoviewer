//
//  Date+Extensions.swift
//  Cryptoviewer
//
//  Created by Developer on 18/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//
import Foundation
extension Date {
    func dateAdding24H()->Date{
       let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: self)!
        return modifiedDate
    }
    
    func dateFormattedForUrl()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self) + "T00%3A00%3A00Z"
    }
}
