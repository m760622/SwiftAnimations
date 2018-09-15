//
//  ViewController.swift
//  LabelCounter
//
//  Created by Anantha Krishnan K G on 15/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLable1: UILabel!
    @IBOutlet var countLabel2: UILabel!
    @IBOutlet var countLabel3: UILabel!
    
    let startValue:Double = 0
    let endValue:Double = 1000
    let duration:Double = 1.5
    let startTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLable1.setShadow()
        countLabel2.setShadow()
        countLabel3.setShadow()
        startAnimation()
    }
    
    func startAnimation () {
    
        let labelAnimation = CADisplayLink(target: self, selector: #selector(loader))
        
        labelAnimation.add(to: .main, forMode: .default)
    }
    
    @objc func loader() {
        
        let time = Date()
        let elapsedTime = time.timeIntervalSince(startTime)
        
        if elapsedTime > duration {
            countLable1.text = "\(endValue)"
            
        } else {
            
            let percentage = elapsedTime / duration
            let value = percentage * (endValue - startValue)
            countLable1.text = "\(value)"
        }
    }


}

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
