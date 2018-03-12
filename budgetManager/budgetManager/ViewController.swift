//
//  ViewController.swift
//  budgetManager
//
//  Created by Adroitent INC on 12/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
   
    var monthSalary: Int?
    var monthySavings: Int?
//    monthSavings = monthSalary - 5000

    @IBOutlet weak var buttonName: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "875790e8f87b923")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = "self"
        cell.backgroundColor = UIColor.init(red: 0.50, green: 0.5, blue: 0.5, alpha: 0.1)
        return cell
    }
//    @IBAction func buttonTap(_ sender: UIButton)
//    {
//       let popOverVc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
//        self.addChildViewController(popOverVc)
//        popOverVc.view.frame = self.view.frame
//        self.view.addSubview(popOverVc.view)
//        popOverVc.didMove(toParentViewController: self)
//
//    }
    

}

