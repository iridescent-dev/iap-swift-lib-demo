//
//  ProductTableViewCell.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import StoreKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func show(product: SKProduct){
        // Show product name in Label.
        titleLabel?.text = product.localizedTitle
        
        // Get localized and formatted price text.
        var priceText = ""
        let period = product.localizedSubscriptionPeriod
        if (period != nil) {
            priceText = "[price] / [period]"
            priceText = priceText.replacingOccurrences(of: "[period]", with: "\(period!)")
            
            if product.hasIntroductoryPriceEligible() {
                if product.introductoryPrice!.numberOfPeriods == 1 {
                    priceText = "[intro_price] for [intro_duration] (then \(priceText))"
                } else {
                    priceText = "[intro_price] / [intro_period] for [intro_duration] (then \(priceText))"
                }
                
                priceText = priceText.replacingOccurrences(of: "[intro_period]", with: "\(product.localizedIntroductoryPeriod ?? "")")
                priceText = priceText.replacingOccurrences(of: "[intro_price]", with: "\(product.localizedIntroductoryPrice ?? "")")
                priceText = priceText.replacingOccurrences(of: "[intro_duration]", with: "\(product.localizedIntroductoryDuration ?? "")")
                
            }
        } else {
            priceText = "[price]"
        }
        priceText = priceText.replacingOccurrences(of: "[price]", with: "\(product.localizedPrice)")
        
        // Show product price in Label.
        descriptionLabel?.text = priceText
    }
}
