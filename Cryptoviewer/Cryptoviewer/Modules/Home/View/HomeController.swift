//
//  ViewController.swift
//  Cryptoviewer
//
//  Created by ESFDS on 08/01/2021.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupTableView()
        setupSearchbar()
        setupCurrencyTypeFilterButton()
        navigationItem.title = "Cryptoviewer"
        LoadingView.show()
    }   
    
    func setupSearchbar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let sc = UISearchController(searchResultsController: nil)
        sc.searchBar.placeholder = "Search..."
        sc.searchResultsUpdater = self
        sc.delegate = self
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
        let item = UIBarButtonItem(title: AppConfig.shared.appCurrency == .euro ? "Є EUR":"$ USD", style: .done, target: self, action: #selector(switchCurrency(sender:)))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func switchCurrency(sender:Any){
        let alertController = UIAlertController(title: "Currecy type", message: "Select a currency", preferredStyle: .actionSheet)
        let actionEUR = UIAlertAction(title: "Є EUR \(AppConfig.shared.appCurrency == .euro ? "(Current)":"")" , style: .default) { (action) in
            if AppConfig.shared.appCurrency == .euro{
                return
            }
            AppConfig.shared.appCurrency = .euro
            self.setupCurrencyTypeFilterButton()
            LoadingView.show()
            self.presenter.viewDidLoad()
        }
        let actionUSD = UIAlertAction(title: "$ USD \(AppConfig.shared.appCurrency == .usd ? "(Current)":"")", style: .default) { (action) in
            if AppConfig.shared.appCurrency == .usd{
                return
            }
            AppConfig.shared.appCurrency = .usd
            self.setupCurrencyTypeFilterButton()
            LoadingView.show()
            self.presenter.viewDidLoad()
        }
        
        alertController.addAction(actionEUR)
        alertController.addAction(actionUSD)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

extension HomeController:HomeViewInterface, UITableViewDelegate, UITableViewDataSource {
    
    func reloadView() {
        DispatchQueue.main.async {
            LoadingView.hide()
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCurrencies
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cryptoCurrency = presenter.currencyForIndex(indexPath.row),
              let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCurrencyCell.identifier) as? CryptoCurrencyCell else {
            return UITableViewCell()
        }
        cell.bindCurrency(cryptoCurrency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cryptoCurrency = presenter.currencyForIndex(indexPath.row) else { return }
        presenter.didPressNavigateToCurrencyDetail(cryptoCurrency)
    }
}

extension HomeController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text, query != "" {
            presenter.query = query
        }
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        if let query = searchController.searchBar.text, query == ""{
            presenter.query = query
        }
    }
}
