//
//  TableViewController.swift
//  multiples
//
//  Created by Adroitent INC on 07/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    var numberData: Int?
   // var delegate: loadingDelegate?
    @IBOutlet var buttonName: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var multiplication = [] as Array
    
    var selectedValue:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for multiplier in 1...10{
            let value = selectedValue! * multiplier
            multiplication.append(value)
        }
        

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! UITableViewCell
        cell.textLabel?.text = "\(multiplication[indexPath.row])"
        return cell
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        //print("button pressed")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}

