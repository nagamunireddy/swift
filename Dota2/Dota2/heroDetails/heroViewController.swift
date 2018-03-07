//
//  heroViewController.swift
//  Dota2
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class heroViewController: UIViewController {
    var hero: heroStats?
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var rangeLbl: UILabel!
    @IBOutlet var attackTypeLbl: UILabel!
    @IBOutlet var rolesLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = hero?.localized_name
        rangeLbl.text = "\(hero?.attack_range)!"
        attackTypeLbl.text = hero?.attack_type
        rolesLbl.text = hero?.primary_attr
        

        // Do any additional setup after loading the view.
    }


}
