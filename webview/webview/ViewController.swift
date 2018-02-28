//
//  ViewController.swift
//  webview
//
//  Created by Adroitent INC on 28/02/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonPressed: UIButton!
    @IBOutlet weak var navigator: UINavigationItem!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            webv()
    }
    
    func webv() {
        let getURL = URL(string: "https://www.google.com")
        let GetRequest = URLRequest(url: getURL!)
        webView.load(GetRequest)
    }
}

