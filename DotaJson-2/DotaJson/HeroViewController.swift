//
//  HeroViewController.swift
//  DotaJson
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit


class HeroViewController: UIViewController{
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var attributeLB: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var legsLb: UILabel!
     var hero:HeroStats?
    
    var name:String = ""
    var attribute:String = ""
    var attackValue:String = ""
    var legs:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("values \(String(describing: hero))")
        
        self.nameLb.text = name
        self.attributeLB.text = attribute
        self.attack.text = attackValue
        self.legsLb.text = legs
        
//        nameLb.text = hero?
//        attributeLB.text = hero?.primary_attr
//        attack.text = hero?.attack_type
//        //legsLb.text = "\((hero?.legs)!)"
        
    }
}
