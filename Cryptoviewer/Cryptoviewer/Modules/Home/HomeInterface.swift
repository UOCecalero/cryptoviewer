//
//  HomeInterface.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import Foundation

enum HomeNavigationOption {
    case currencyDetail(_ currency: CryptoCurrency)
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomePresenterInterface: PresenterInterface {
    func didPressNavigateToCurrencyDetail(_ currency: CryptoCurrency)
    var crytpCurrenciesList: [CryptoCurrency]? { get }
}

protocol HomeViewInterface: ViewInterface {
    func reloadView()
}

protocol HomeInteractorInterface: InteractorInterface {
    func fetchCryptoCurrency(completionHandler: @escaping ([CryptoCurrency]) -> Void)
}
