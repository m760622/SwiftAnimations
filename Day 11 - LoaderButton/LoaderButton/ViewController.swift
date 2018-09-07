//
//  ViewController.swift
//  LoaderButton
//
//  Created by Anantha Krishnan K G on 06/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var submitButton: UIButton!
    
    var layerPath: UIBezierPath!
    var backgroundLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    var originalFrame:CGRect!
    
    var timer: Timer!
    var downloadProgressTracker:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.setTitle("submit", for: UIControl.State.normal)
        submitButton.layer.cornerRadius = 25
        
        self.submitButton.setImage(UIImage(named: ""), for: .normal)
        self.submitButton.imageView?.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.submitButton.backgroundColor = UIColor.getBGColor()

    }

    @IBAction func submitButtonAction(_ sender: UIButton) {
       
       
       
    }
    
    
  
    
}

