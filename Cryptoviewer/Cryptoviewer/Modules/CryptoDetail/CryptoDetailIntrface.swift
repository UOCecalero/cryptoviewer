//
//  CryptoDetailInterce.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//


protocol CryptoDetailPresenterInterface: PresenterInterface {
    var cryptoCurrency: CryptoCurrency? { get }
}

protocol CryptoDetailViewInterface: ViewInterface {
    func reloadView()
}

protocol CryptoDetailInteractorInterface: InteractorInterface {
    func fetchSparklineForCurrency(completionHandler: @escaping ([ChartItemPresentation]) -> Void)
}

protocol CryptoDetailWireframeInterface: WireframeInterface {
    
}
