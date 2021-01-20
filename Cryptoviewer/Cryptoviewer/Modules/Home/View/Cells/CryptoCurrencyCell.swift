//
//  CryptoCurrencyCell.swift
//  Cryptoviewer
//
//  Created by Developer on 12/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit
import SVGParser
class CryptoCurrencyCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var variationLabel: UILabel!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func bindCurrency(_ currency:CryptoCurrency){
        nameLabel.text = currency.name
        abbreviationLabel.text = currency.symbol
        priceLabel.text = currency.price.toCurrencyFormat(localeFormat: AppConfig.shared.appCurrenyFormat)
        variationLabel.text = currency.currentDayData.priceVariation.toPercent()
        variationLabel.textColor = currency.priceVariationDouble > 0 ? AppColors.positive.variationColor : AppColors.negative.variationColor
        if let url = URL(string: currency.logoUrl){
            iconImageView.setImageFromUrl(from: url, contentMode: .scaleAspectFit)
        }
       
    }
    
    override func prepareForReuse() {
        iconImageView.image = nil
    }

}
