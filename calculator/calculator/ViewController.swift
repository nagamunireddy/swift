//
//  ViewController.swift
//  calculator
//
//  Created by Adroitent INC on 28/02/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        }
        }
    @IBAction func buttons(_ sender: UIButton)
    {
        
        if label.text != "" && sender.tag == 11 && sender.tag == 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 //divide
            {
                label.text = "/"
            }
            if sender.tag == 13 //multiply
            {
                label.text = "*"
            }
            if sender.tag == 14 //subtraction
            {
                label.text = "-"
            }
            if sender.tag == 15 //addition
            {
                label.text = "+"
            }
            performingMath = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

