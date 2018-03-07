//
//  ViewController.swift
//  decoding
//
//  Created by Adroitent INC on 07/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var heroes = [heroStats]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DownloadJSON {
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return heroes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ) as! UITableViewCell
        
        cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        return cell
    }
    
    func DownloadJSON(completed: @escaping  () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([heroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("JSON error")
                }
            }
            
            }.resume()
        
    }
    
}

