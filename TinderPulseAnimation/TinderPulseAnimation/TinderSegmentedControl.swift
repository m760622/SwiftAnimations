//
//  TinderSegmentedControl.swift
//  TinderPulseAnimation
//
//  Created by Anantha Krishnan K G on 05/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

@IBDesignable class TinderSegmentedControl: UISegmentedControl {

 
    @IBInspectable public var borderColor: UIColor = UIColor.darkGray {
        didSet {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = 1.5
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
    }
    
    
}
