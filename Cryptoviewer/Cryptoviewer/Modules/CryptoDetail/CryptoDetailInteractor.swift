//
//  CryptoDetailInteractor.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//
import Foundation
let domainUrlString1 = "https://api.nomics.com/v1/currencies?key=8e4975143d509c9e7ef1c56f38eaa7b6&ids=ETH"

final class CryptoDetailInteractor {
    
    func _fetchCryptoCurrencyMetadata(_ completionHandler: @escaping ([CryptoCurrency]) -> Void) {
        guard let url = URL(string: domainUrlString1) else { return print("Error fetching API, no given URL within the function")}
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching crypto currrencies: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected result. \n response: \(String(describing: response))\n error : \(String(describing: error))")
                return
            }
            if let data = data,
               let currenciesList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) {
                completionHandler(currenciesList)
            }
        })
        task.resume()
    }
}

extension CryptoDetailInteractor: CryptoDetailInteractorInterface {
    func fetchSparklineForCurrency(currencyId:String, completionHandler: @escaping ([ChartItem]) -> Void) {
        
        let dateStart = Date().dateFormattedForUrl()
        let dateEnd = Date().dateAdding24H().dateFormattedForUrl()
        
        let urlFetchCurrencies = AppConstans.apiURL.toString
            + AppEndpoints.fetchSparkline.toString
            + "?key=" + AppConstans.apiKey.toString
            + "&ids=\(currencyId)"
            + "&start=\(dateStart)"
            + "&end=\(dateEnd)"
            + "&convert=\(AppConfig.shared.appCurrency.toString)"
        guard let url = URL(string: urlFetchCurrencies) else { return print("Error fetching API, no given URL within the function")}
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching crypto currrencies: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected result. \n response: \(String(describing: response))\n error : \(String(describing: error))")
                return
            }
            if let data = data,
                let chartItemsResponseArray = try? JSONDecoder().decode([ChartItemsResponse].self, from: data),
                let chartItemsResponse = chartItemsResponseArray.first {
                var arrayTimeSpans = [ChartItem]()
                for i in 0..<chartItemsResponse.timestamps.count{
                    let timeSpan = chartItemsResponse.timestamps[i]
                    let price = chartItemsResponse.prices[i]
                    let priceDouble = Double(price) ?? 0
                    let priceFormatted = price.toCurrencyFormat(localeFormat: AppConfig.shared.appCurrenyFormat)
                    let timeSpanFormatted = timeSpan.toHourFromTimeSpan()
                    arrayTimeSpans.append(ChartItem(date: timeSpan, dateFormatter: timeSpanFormatted, price: priceDouble, priceFormatter: priceFormatted))
                }
                completionHandler(arrayTimeSpans)
            }
        })
        task.resume()
    }
    
    
}
