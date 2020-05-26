//
//  ProductsTableViewController.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import StoreKit
import InAppPurchaseLib

class ProductsTableViewController: UITableViewController {
    private var loaderView = LoaderView()
    
    override func viewWillAppear(_ animated: Bool) {
        // refresh view
        tableView.reloadData()
        
        if InAppPurchase.getProducts().isEmpty {
            self.loaderView.show(parent: self.view)
        }
        InAppPurchase.refresh(callback: { _ in
            self.loaderView.hide()
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InAppPurchase.getProducts().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IAPProductCell", for: indexPath) as? ProductTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
        }
        cell.show(product: InAppPurchase.getProducts()[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productIdentifier = InAppPurchase.getProducts()[indexPath.row].productIdentifier
        
        self.loaderView.show(parent: self.view)
        InAppPurchase.purchase(
            productIdentifier: productIdentifier,
            callback: { result in
                self.loaderView.hide()
                switch result.state {
                case .purchased:
                    print("Product purchased successful.")
                    
                case .failed:
                    print("Purchase failed: \(result.localizedDescription ?? "").")
                    
                case .cancelled:
                    print("The user canceled the payment request.")
                    
                case .deferred:
                    print("The purchase was deferred.")
                }
        })
    }
}
