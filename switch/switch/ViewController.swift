//
//  ViewController.swift
//  switch
//
//  Created by Adroitent INC on 01/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sliderBar: UISlider!
    @IBOutlet var switchState: UISwitch!
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        switchState.addTarget(self, action: #selector(stateChanged), for: UIControlEvents.valueChanged)
        
    }
    @IBAction func slider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
       textField.text = "\(currentValue)"
    }
    
    @IBAction func buttonClicked(_ sender: Any)
    {
     
        if switchState.isOn {
            textField.text = "switch is off"
            switchState.setOn(false, animated: true)
            
        } else {
            textField.text = "switch is on"
            switchState.setOn(true, animated: true)
        }
        
    }
   @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            textField.text = "is ON"
        } else {
            textField.text = "is OFF"
        }
    }
    

    
}

