//
//  CryptoDetailWireframe.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

final class CryptoDetailWireframe: BaseWireframe {
    init(_ currency: CryptoCurrency) {
        let moduleViewController = CryptoDetailViewController(nibName: "CryptoDetailViewController", bundle: nil)
        super.init(viewController: moduleViewController)
        let interactor = CryptoDetailInteractor()
        let presenter = CryptoDetailPresenter(wireframe: self, view: moduleViewController, interactor: interactor, currency)
        moduleViewController.presenter = presenter
    }
}

extension CryptoDetailWireframe:CryptoDetailWireframeInterface {
    
}
