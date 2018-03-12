//
//  TableTableViewController.swift
//  DotaJson
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

protocol loadingDelegate {
    func loadingView(name:String, attack:String, attribute:String)
}

class TableTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, loadingDelegate{
    var heroes = [HeroStats]()
    
    @IBOutlet weak var exmpTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        exmpTableView.delegate = self
        exmpTableView.dataSource = self
        downloadJSON{
            self.exmpTableView.reloadData()
        }
        
    }
    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return heroes.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exmpTableView.dequeueReusableCell(withIdentifier: "TableTableviewCellTableViewCell") as!
           TableTableviewCellTableViewCell
        cell.delegate = self
       cell.textLabel?.text = heroes[indexPath.row].localized_name.capitalized
        cell.attack = heroes[indexPath.row].attack_type.capitalized
        cell.attribute = heroes[indexPath.row].primary_attr.capitalized
        cell.name = heroes[indexPath.row].localized_name.capitalized
       
     
        return cell
      
}
    
    func downloadJSON(completed: @escaping () -> ())
    {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil{
                do{
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch{
                    print("JSON error")
                }
            }
            }.resume()
        
    }
    
    func loadingView(name: String, attack: String, attribute: String) {
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "showDetails") as! HeroViewController
        viewController.name = name
        viewController.attackValue = attack
        viewController.attribute = attribute
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

}


