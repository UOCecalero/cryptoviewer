//
//  ViewController.swift
//  Cryptoviewer
//
//  Created by ESFDS on 08/01/2021.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

     var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HomeController: HomeViewInterface{
    func reloadView() {
        
    }

}
