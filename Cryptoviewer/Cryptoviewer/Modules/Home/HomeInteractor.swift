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
        
    }
}
extension HomeInteractor: HomeInteractorInterface {
    func fetchCryptoCurrency(completionHandler: @escaping ([CryptoCurrency]) -> Void) {
        _fetchCryptoCurrency(completionHandler)
    }
}
