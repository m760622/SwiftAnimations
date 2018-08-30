//
//  UIViewX.swift
//  CollisionAnimation
//
//  Created by Anantha Krishnan K G on 30/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class UIViewX: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        layer.cornerRadius = frame.width/2
        backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(CGFloat(arc4random()%50000)/50000);
        let green = CGFloat(CGFloat(arc4random()%50000)/50000);
        let blue = CGFloat(CGFloat(arc4random()%50000)/50000);
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0);
    }
    
}
