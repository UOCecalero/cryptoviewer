//
//  String+Extensions.swift
//  Cryptoviewer
//
//  Created by alexei on 17/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//
import Foundation
extension String {
    
    func toPercent()->String{
        guard  let doubleValue = Double(self) else {
            return ""
        }
        return  String(format: "\(doubleValue > 0 ? "+":"")%.2f%%", doubleValue*100)
    }
    
    func toCurrencyFormat(localeFormat:String?) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier:localeFormat ?? "es_ES")
        guard let doubleValue = Double(self), let currencyStr = numberFormatter.string(from: NSNumber(value: doubleValue)) else {
            return ""
        }
        return currencyStr
    }
    
    func toHourFromTimeSpan()->String{
        let dateFormatter = DateFormatter()
        var str = self.replacingOccurrences(of: "T", with: "-")
        str = str.replacingOccurrences(of: "Z", with: "")
        str = str.replacingOccurrences(of: ":", with: "-")
        dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        
        guard let  date = dateFormatter.date(from: str) else {
            return ""
        }
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
