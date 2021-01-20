//
//  YAxisValueFormatter.swift
//  Cryptoviewer
//
//  Created by alexei on 18/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import Charts

class YAxisValueFormatter: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let localeFormat = AppConfig.shared.appCurrenyFormat
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier:localeFormat)
        guard  let currencyStr = numberFormatter.string(from: NSNumber(value: value)) else {
            return ""
        }
        return currencyStr
        
    }
}
