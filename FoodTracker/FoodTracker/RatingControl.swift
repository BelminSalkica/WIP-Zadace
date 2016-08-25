//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Belmin Salkica on 8/25/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    let spacing = 5
    let starCount = 5
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    // MARK: Initialization 
    override func layoutSubviews() {
        // Sets button size to the square of frame's height
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        
        // Button
        for _ in 0..<starCount {
            let button = UIButton()
            button.adjustsImageWhenHighlighted = false
            
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Selected, .Highlighted])
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            // Add button to the RatingControl view
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))

        return CGSize(width: width, height: buttonSize)
    }
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionState()
    }
    
    func updateButtonSelectionState() {
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
}
