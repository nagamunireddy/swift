//
//  TableTableViewController.swift
//  Dota2
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    @IBOutlet var button: UIButton!
    @IBAction func view(_ sender: UIButton)
    {
    }
    var heroes = [heroStats]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DownloadJSON {
            self.tableView.reloadData()
        }
        //  tableView.delegate = self
        //tableView.dataSource = self
    }
    
    //Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default , reuseIdentifier: nil)
        
        cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        
        //cell.view
        return cell
    }
    
    //
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    //
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? heroViewController {
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    //
    
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
