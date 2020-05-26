//
//  ProductStatusesTableViewController.swift
//  InAppPurchaseLibDemo
//
//  Created by Veronique on 06/05/2020.
//  Copyright © 2020 Iridescent. All rights reserved.
//

import UIKit
import InAppPurchaseLib

class ProductStatusesTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        // refresh view
        tableView.reloadData()
        
        InAppPurchase.refresh(callback: { _ in
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return InAppPurchase.iapProducts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductStatusTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProductStatusTableViewCell.")
        }
        
        cell.show(iapProduct: InAppPurchase.iapProducts[indexPath.section])
        return cell
    }
}
