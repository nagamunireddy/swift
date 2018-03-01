//
//  ViewController.swift
//  stopWatch
//
//  Created by Adroitent INC on 01/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Double = 0.0
    var timer = Timer()
    var isPlaying = false
    
    @IBAction func startTimer(_ sender: Any) {
        
        if (isPlaying) {
            return
        }
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        label.text = String(counter)
        
    }
    
    @objc func UpdateTimer(){
        
        counter = counter + 0.1
        label.text = String(format: "%.1f", counter)
        
    }
   
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = String(counter)
        stopButton.isEnabled = false
    }

    
   

}

