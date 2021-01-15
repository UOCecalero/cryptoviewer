//
//  HomeWireframe.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

class HomeWireframe: BaseWireframe {
    init() {
        let moduleViewController = HomeController(nibName: "HomeController", bundle: nil)
        super.init(viewController: moduleViewController)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
    
    private func _navigateToCCurrencyDetail(_ cryptoCurrency: CryptoCurrency) {
        navigationController?.pushWireframe(CryptoDetailWireframe(cryptoCurrency))
    }
}
extension HomeWireframe:HomeWireframeInterface{
    func navigate(to option: HomeNavigationOption) {
        switch option {
        case .currencyDetail(let currency):
            _navigateToCCurrencyDetail(currency)
        }
    }
}
