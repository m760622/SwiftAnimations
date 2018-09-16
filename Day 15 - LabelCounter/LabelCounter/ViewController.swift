//
//  ViewController.swift
//  LabelCounter
//
//  Created by Anantha Krishnan K G on 15/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel1: UILabel!
    @IBOutlet var countLabel2: UILabel!
    @IBOutlet var countLabel3: UILabel!
    
    let startValue:Double = 0
    let endValue:Double = 5000
    let duration:Double = 5.0
    let startTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup labels
        countLabel1.setShadow()
        countLabel2.setShadow()
        countLabel3.setShadow()
    }
    
    // IBAction for counter
    @IBAction func startAnimation(_ sender: Any) {

        let labelAnimation = CADisplayLink(target: self, selector: #selector(loader))
        labelAnimation.add(to: .main, forMode: .default)
    }
    
    // Loader function
    @objc func loader() {
        
        let time = Date()
        let elapsedTime = time.timeIntervalSince(startTime)
        
        if elapsedTime > duration {
            countLabel1.text = "\(Int(endValue))"
            countLabel2.text = "\(Int(endValue))"
            countLabel3.text = "\(Int(endValue))"
            
        } else {
            
            let percentage = elapsedTime / duration
            let value = percentage * (endValue - startValue)
            countLabel1.text = "\(Int(value))"
            countLabel2.text = "\(Int(value))"
            countLabel3.text = "\(Int(value))"
        }
    }


}

// Shadow set method
extension UILabel {
    
    func setShadow() {
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.masksToBounds = true
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
    }
}
