//
//  CryptoDetailViewController.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

class CryptoDetailViewController: UIViewController {
    
    var presenter: CryptoDetailPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}
extension CryptoDetailViewController: CryptoDetailViewInterface {
    func reloadView() {
        
    }
}
