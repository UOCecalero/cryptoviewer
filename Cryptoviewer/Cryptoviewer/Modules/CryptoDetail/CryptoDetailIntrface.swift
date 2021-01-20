//
//  CryptoDetailInterce.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//


protocol CryptoDetailPresenterInterface: PresenterInterface {
    var cryptoCurrency: CryptoCurrency? { get }
    var chartItems:[ChartItem]  { get }
}

protocol CryptoDetailViewInterface: ViewInterface {
    func loadChart()
}

protocol CryptoDetailInteractorInterface: InteractorInterface {
    func fetchSparklineForCurrency(currencyId:String, completionHandler: @escaping ([ChartItem]) -> Void)
}

protocol CryptoDetailWireframeInterface: WireframeInterface {
    
}
