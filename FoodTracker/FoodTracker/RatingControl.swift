//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Adroitent INC on 22/02/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    @IBDesignable class RatingControl: UIStackView {
        
        @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
            didSet {
                setupButtons()
            }
        }
        
        @IBInspectable var starCount: Int = 5 {
            didSet {
                setupButtons()
            }
        }


    private var ratingButtons = [UIButton]()
    
    var rating = 0
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
    //MARK: private methods
    private func setupButtons() {
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
}
