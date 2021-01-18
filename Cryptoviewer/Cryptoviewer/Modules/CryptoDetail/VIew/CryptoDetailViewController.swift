//
//  CryptoDetailViewController.swift
//  Cryptoviewer
//
//  Created by Developer on 14/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit
import Charts
class CryptoDetailViewController: UIViewController, ChartViewDelegate {
    
    var presenter: CryptoDetailPresenterInterface!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var variationLabel: UILabel!
    @IBOutlet weak var charContainerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    var mainColor:UIColor!
    
    
    lazy var backButton:UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "back_arrow"), style: .done, target: self, action: #selector(goBack))
        return button
    }()
    
    lazy var chartView: LineChartView = {
        let lineChartView = LineChartView()
        lineChartView.frame = charContainerView.bounds
        lineChartView.delegate = self
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: presenter.chartItems.map { $0.dateFormatter})
        lineChartView.leftAxis.valueFormatter = YAxisValueFormatter()
        lineChartView.rightAxis.enabled = false
        var yValues = [ChartDataEntry]()
        for (i,chartItem) in presenter.chartItems.enumerated(){
            print(i)
            yValues.append(ChartDataEntry(x: Double(i), y: chartItem.price))
        }
        let set = LineChartDataSet(entries: yValues,label: "Price (24h)")
        set.drawCirclesEnabled = false
        set.lineWidth = 2
        set.setColor( presenter.cryptoCurrency!.priceVariationDouble > 0 ? AppColors.positive.variationColor : AppColors.negative.variationColor)
        set.drawValuesEnabled = false //show values
        let gradient =  presenter.cryptoCurrency!.priceVariationDouble > 0 ? AppColors.positive.gradientColor :  AppColors.negative.gradientColor
        set.drawFilledEnabled = true
        set.fill = Fill(linearGradient: gradient, angle: 90)
        let data = LineChartData(dataSet: set)
        lineChartView.data = data
        return lineChartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = backButton
        presenter.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        guard let cryptoCurrency = self.presenter.cryptoCurrency else {
            return
        }
        mainColor =  (Double(cryptoCurrency.currentDayData.priceVariation) ?? 0 ) > 0 ? AppColors.positive.variationColor : AppColors.negative.variationColor
        nameLabel.text = cryptoCurrency.name
        abbreviationLabel.text = cryptoCurrency.symbol
        priceLabel.text = cryptoCurrency.price.toCurrencyFormat(localeFormat: AppConfig.shared.appCurrenyFormat)
        priceTitleLabel.text = cryptoCurrency.symbol + " price"
        variationLabel.text = cryptoCurrency.currentDayData.priceVariation.toPercent()
        variationLabel.textColor = mainColor
        
        if let urlString = presenter.cryptoCurrency?.logoUrl,  let url = URL(string: urlString){
            iconImageView.setImageFromUrl(from: url, contentMode: .scaleAspectFit)
        }
    }
    @objc
    func goBack(sender:Any){
        self.navigationController?.popViewController(animated: true)
    }
}
extension CryptoDetailViewController: CryptoDetailViewInterface {
    func reloadView() {
        
    }
    
    func loadChart(){
        DispatchQueue.main.async {
            self.charContainerView.addSubview(self.chartView)
        }
    }
}
