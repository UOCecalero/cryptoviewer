//
//  AppConfig.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import Foundation
import UIKit.UIColor

enum AppConstans : String {
    case apiKey = "8e4975143d509c9e7ef1c56f38eaa7b6"
    case apiURL = "https://api.nomics.com/v1/"
    var toString:String {
        return self.rawValue
    }
}

enum AppEndpoints: String {
    case fetchCurrencies = "currencies/ticker"
    case fetchSparkline = "currencies/sparkline"
    var toString: String{
        return self.rawValue
    }
}

enum AppCurrencies : String {
    case euro = "EUR"
    case usd = "USD"
    var toString: String{
        return self.rawValue
    }
}

enum AppColors {
    case positive
    case negative
    var variationColor : UIColor {
        switch self {
        case .positive:
            return #colorLiteral(red: 0.4078431373, green: 0.8588235294, blue: 0.2980392157, alpha: 1)
        case .negative:
            return  #colorLiteral(red: 0.8980392157, green: 0.1254901961, blue: 0.1254901961, alpha: 1)
        }
    }
    
    var gradientColor: CGGradient{
        switch self {
        case .positive:
            let gradientColors = [#colorLiteral(red: 0.3568627451, green: 0.8549019608, blue: 0.6431372549, alpha: 0).cgColor, #colorLiteral(red: 0.3568627451, green: 0.8549019608, blue: 0.6431372549, alpha: 1).cgColor]
            return CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        case .negative:
            let gradientColors = [#colorLiteral(red: 0.8980392157, green: 0.1254901961, blue: 0.1254901961, alpha: 0).cgColor, #colorLiteral(red: 0.8980392157, green: 0.1254901961, blue: 0.1254901961, alpha: 1).cgColor]
            return CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        }
    }
}

enum AppCurrencyFormat : String {
    case ES_ES = "es_ES"
    case EN_US = "en_US"
}

class AppConfig {
    static let shared = AppConfig()
    var appCurrency:AppCurrencies
    var appCurrenyFormat:String  {
        return self.appCurrency == .euro ? AppCurrencyFormat.ES_ES.rawValue: AppCurrencyFormat.EN_US.rawValue
    }
    
    init() {
        appCurrency = AppCurrencies.euro
    }
    
    func swichAppCurrency(){
        appCurrency = appCurrency == .euro ? .usd : .euro
    }
}

