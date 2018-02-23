//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Adroitent INC on 22/02/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
   // @IBDesignable class RatingControl: UIStackView {
        
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
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
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
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    //MARK: private methods
        private func setupButtons() {
            
            // clear any existing buttons
            for button in ratingButtons {
                removeArrangedSubview(button)
                button.removeFromSuperview()
            }
            ratingButtons.removeAll()
            
            let bundle = Bundle(for: type(of: self))
            let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
            let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
            let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
            
            for _ in 0..<starCount {
                // Create the button
                let button = UIButton()
                button.setImage(emptyStar, for: .normal)
                button.setImage(filledStar, for: .selected)
                button.setImage(highlightedStar, for: .highlighted)
                button.setImage(highlightedStar, for: [.highlighted, .selected])
                
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
            updateButtonSelectionStates()
        }

    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            
            button.isSelected = index < rating
        }
    }
}

