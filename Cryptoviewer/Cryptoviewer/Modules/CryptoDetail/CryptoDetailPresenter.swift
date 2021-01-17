//
//  CryptoDetailPresenter.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

final class CryptoDetailPresenter {
    
    private let _wireframe: CryptoDetailWireframeInterface
    private unowned let _view: CryptoDetailViewInterface
    private let _interactor: CryptoDetailInteractorInterface
    
    var cryptoCurrency: CryptoCurrency?
    var chartItems:[ChartItemPresentation]? {
        didSet{
            
        }
    }
    
    init(wireframe: CryptoDetailWireframeInterface, view: CryptoDetailViewInterface, interactor: CryptoDetailInteractorInterface, _ cryptoCurrency: CryptoCurrency) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
        self.cryptoCurrency = cryptoCurrency
    }
    
}

extension CryptoDetailPresenter: CryptoDetailPresenterInterface {
    func viewDidLoad() {
        _interactor.fetchSparklineForCurrency { (chartItems) in
            self.chartItems = chartItems
        }
    }
   
}
