//
//  HomePresenter.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//


final class HomePresenter {
    private let _wireframe: HomeWireframeInterface
    private unowned let _view: HomeViewInterface
    private let _interactor: HomeInteractorInterface
    
    var crytpCurrenciesList: [CryptoCurrency]? {
        didSet {
            _view.reloadView()
        }
    }
    
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface) {
        _view = view
        _wireframe = wireframe
        _interactor = interactor
    }
}

extension HomePresenter: HomePresenterInterface {
    func didPressNavigateToCurrencyDetail(_ currency: CryptoCurrency) {
        _wireframe.navigate(to: .currencyDetail(currency))
    }
    func viewDidLoad() {
        
    }
    
}
