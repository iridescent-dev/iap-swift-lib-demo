//
//  PurchasesViewController.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import InAppPurchaseLib

class PurchasesViewController: UIViewController {

    private var loaderView = LoaderView()
    
    // MARK: - Action called on touchUpInside
    @IBAction func restorePurchases(_ sender: Any) {
        self.loaderView.show(parent: self.view)
        InAppPurchase.restorePurchases(callback: { result in
            self.loaderView.hide()
            switch result.state {
            case .succeeded:
                if result.addedPurchases > 0 {
                    print("Restore purchases successful.")
                } else {
                    print("No purchase to restore.")
                }
            case .failed:
                print("Restore purchases failed.")
            }
        })
    }
}
