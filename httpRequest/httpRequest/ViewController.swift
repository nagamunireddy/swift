//
//  ViewController.swift
//  httpRequest
//
//  Created by Adroitent INC on 28/02/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        var httpURL = URL(string: "https://apple.com")!
        var httpTask = URLSession.shared.dataTask(with: httpURL) {
            (data, response, error) in
            guard let validData = data, error == nil else {
                DispatchQueue.main.async(execute: {
                    print("Error getting apple website\n") })
                return
            }
            var results = String(data: data!, encoding: String.Encoding.utf8) ?? "Error decoding Apple's website HTML\n"
            DispatchQueue.main.async(execute: {
                print("Correctly read \(results.characters.count) characters from Apple's website HTML\n")
            })
        }
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
            httpTask.resume()
        })
    }
    
}

