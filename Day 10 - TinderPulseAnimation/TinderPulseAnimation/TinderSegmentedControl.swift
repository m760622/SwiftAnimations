//
//  TinderSegmentedControl.swift
//  TinderPulseAnimation
//
//  Created by Anantha Krishnan K G on 05/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

@IBDesignable class TinderSegmentedControl: UISegmentedControl {

    @IBInspectable public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
    }
    
    
}
