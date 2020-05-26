//
//  ProductStatusTableViewCell.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import InAppPurchaseLib

class ProductStatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var expiryStackView: UIStackView!
    @IBOutlet weak var expiryDateLabel: UILabel!
    
    func show(iapProduct: IAPProduct){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale    = Locale(identifier: "EN-en")
        
        titleLabel?.text = iapProduct.productIdentifier
        
        let purchaseDate =  InAppPurchase.getPurchaseDate(for: iapProduct.productIdentifier)
        purchaseDateLabel?.text = purchaseDate != nil ? formatter.string(from: purchaseDate!) : "-"
        
        let expiryDate =  InAppPurchase.getExpiryDate(for: iapProduct.productIdentifier)
        if expiryDate == nil {
            expiryStackView?.removeFromSuperview()
        } else {
            expiryDateLabel?.text = expiryDate != nil ? formatter.string(from: expiryDate!) : "-"
        }
    }
}
