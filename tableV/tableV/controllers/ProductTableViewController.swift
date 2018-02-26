//
//  ProductTableViewController.swift
//  tableV
//
//  Created by Adroitent INC on 26/02/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {

    
    var products = ProductLine.getProductLines()[0].products
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title
        return cell
    }
   

}
