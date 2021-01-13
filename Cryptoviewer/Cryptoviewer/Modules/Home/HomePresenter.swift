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
    
    var filterCurrenciesList:[CryptoCurrency] = []
    
    var query: String? {
        didSet{
            guard let query  = self.query else {
                self.filterCurrenciesList.removeAll()
                return
            }
            
            self.filterCurrenciesList = crytpCurrenciesList?.filter {
                ($0.name.range(of: query, options: .caseInsensitive) != nil) ||
                ($0.symbol.range(of: query, options: .caseInsensitive) != nil)
            } ?? []
            _view.reloadView()
        }
    }
    
    var numberOfCurrencies:Int{
        return (query == nil || query == "") ? (crytpCurrenciesList?.count ?? 0) : filterCurrenciesList.count
        
    }
    
    func currencyForIndex(_ index:Int)->CryptoCurrency?{
        return (query == nil || query == "") ? crytpCurrenciesList?[index] : filterCurrenciesList[index]
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
        _interactor.fetchCryptoCurrency { (currenciesList) in
            self.crytpCurrenciesList = currenciesList
        }
    }
    
}
