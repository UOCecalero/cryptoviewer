//
//  ViewController.swift
//  Cryptoviewer
//
//  Created by ESFDS on 08/01/2021.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTableView()
        setupSearchbar()
        setupCurrencyTypeFilterButton()
        navigationItem.title = "Cryptoviewer"
    }
    
    func setupSearchbar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let sc = UISearchController(searchResultsController: nil)
        sc.searchBar.placeholder = "Busca..."
        sc.searchResultsUpdater = self
        navigationItem.searchController   = sc
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.backgroundView = UIView()
        tableView.allowsSelection = true
        tableView.register( CryptoCurrencyCell.nib, forCellReuseIdentifier:CryptoCurrencyCell.identifier)
    }
    
    func setupCurrencyTypeFilterButton(){
        let item = UIBarButtonItem(title: "Hola", style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem = item
    }
    
}

extension HomeController:HomeViewInterface, UITableViewDelegate, UITableViewDataSource {
    
    func reloadView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCurrencies
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cryptoCurrency = presenter.currencyForIndex(indexPath.row),
              let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCurrencyCell.identifier) as? CryptoCurrencyCell else {
            return UITableViewCell()
        }
        cell.bindCurrency(cryptoCurrency)
        return cell
    }
}

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text, query != "" {
            presenter.query = query
        }
    }
}
