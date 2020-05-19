//
//  PurchaseDelegate.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import Foundation
import InAppPurchaseLib

class PurchaseDelegate: IAPPurchaseDelegate {
    required init(){}
    func productPurchased(productIdentifier: String) {
        // Unlock product related content for consumables and/or non-renewing subscriptions.
        // unlockContent(for: productIdentifier)
        
        // Finish the product transactions.
        InAppPurchase.finishTransactions(for: productIdentifier)
    }
}
