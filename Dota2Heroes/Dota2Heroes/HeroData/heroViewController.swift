//
//  heroViewController.swift
//  Dota2Heroes
//
//  Created by Adroitent INC on 05/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit



class heroViewController: UIViewController {
    
    @IBOutlet var UIImage: UIImageView!
    
    @IBOutlet var legslbl: UILabel!
    @IBOutlet var attacklbl: UILabel!
    @IBOutlet var attributelbl: UILabel!
    @IBOutlet var namelbl: UILabel!
    var hero:heroStats?
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.text = hero?.localized_name
        attributelbl.text = hero?.primary_attr
        attacklbl.text = hero?.attack_type
        legslbl.text = "\((hero?.legs)!)"
}
}

