//
//  PopUpViewController.swift
//  budgetManager
//
//  Created by Adroitent INC on 12/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var popUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Popup Window Details
       self.view.backgroundColor = UIColor.init(hue: 0.12, saturation: 0.25, brightness: 0.34, alpha: 0.25)
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
       
        //TextField Data
        textField.delegate = self
    }

   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLbl.text = textField.text
    }

    @IBAction func popUpWindow(_ sender: Any)
    {
        
        dismiss(animated: true, completion: nil)
      //  self.removeAnimate()
    }
    
    
    
}

//    func showAnimate()
//    {
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        });
//    }
//
//    func removeAnimate()
//    {
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//            self.view.alpha = 0.0;
//        }, completion:{(finished : Bool)  in
//            if (finished)
//            {
//                self.view.removeFromSuperview()
//            }
//        });
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


