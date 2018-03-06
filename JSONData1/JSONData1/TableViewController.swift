//
//  TableViewController.swift
//  JSONData1
//
//  Created by Adroitent INC on 05/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tableData: Array = Array <String>()
    
     guard let url = URL(string: "https://api.github.com/users/shashikant86") else {return}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = tableData[indexPath.row]

        return cell
    }
    
    struct data: Codable {
        
        let name: String?
        let location: String?
        let followers: Int?
        let avatarUrl: URL?
        let repos:Int?
        
        private enum CodingKeys: String, CodingKey {
            case name
            case location
            case followers
            case repos = "public_repos"
            case avatarUrl = "avatar_Url"
        }
    }
   
    

  
}
