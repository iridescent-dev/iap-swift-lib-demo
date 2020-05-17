//
//  StatusesViewController.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import InAppPurchaseLib

class StatusesViewController: UIViewController {
    
    @IBOutlet weak var alreadyPurchaseLabel: UILabel!
    @IBOutlet weak var activeSubscriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        alreadyPurchaseLabel?.text = InAppPurchase.hasAlreadyPurchased() ? "yes" : "no"
        activeSubscriptionLabel?.text = InAppPurchase.hasActiveSubscription() ? "yes" : "no"
    }
}
