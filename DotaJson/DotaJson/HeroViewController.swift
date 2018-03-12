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
   
     var hero:HeroStats?
    
    var name:String = ""
    var attribute:String = ""
    var attackValue:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("values \(String(describing: hero))")
        
        self.nameLb.text = name
        self.attributeLB.text = attribute
        self.attack.text = attackValue
      

        
    }
}
