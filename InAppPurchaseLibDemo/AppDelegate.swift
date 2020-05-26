//
//  AppDelegate.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import InAppPurchaseLib


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Start In App Purchase services
        InAppPurchase.initialize(
            iapProducts: [
                IAPProduct(productIdentifier: "monthly_plan", productType: .autoRenewableSubscription),
                IAPProduct(productIdentifier: "yearly_plan", productType: .autoRenewableSubscription)
            ],
            validatorUrlString: "https://validator.fovea.cc/v1/validate?appName=iapdemo&apiKey=12345678",
            iapPurchaseDelegate: PurchaseDelegate() // optional for non-consumables and/or auto-renewable subscriptions.
        )
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Stop In App Purchase services
        InAppPurchase.stop()
    }
    
    
    // MARK: - UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
