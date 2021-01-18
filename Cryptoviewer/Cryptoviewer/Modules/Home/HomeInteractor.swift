//
//  HomeInteractor.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import Foundation

class HomeInteractor {
    func _fetchCryptoCurrency(_ completionHandler: @escaping ([CryptoCurrency]) -> Void) {
        
        let urlFetchCurrencies = AppConstans.apiURL.toString
            + AppEndpoints.fetchCurrencies.toString
            + "?key=" + AppConstans.apiKey.toString
            + "&convert=\(AppConfig.shared.appCurrency.toString)"
            + "&interval=1d&per-page=20"
        
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
               let currenciesList = try? JSONDecoder().decode([CryptoCurrency].self, from: data) {
                completionHandler(currenciesList)
            }
        })
        task.resume()
    }
}
extension HomeInteractor: HomeInteractorInterface {
    func fetchCryptoCurrency(completionHandler: @escaping ([CryptoCurrency]) -> Void) {
        _fetchCryptoCurrency(completionHandler)
    }
}
