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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLable1.setShadow()
        countLabel2.setShadow()
        countLabel3.setShadow()
    }
    
    func startAnimation () {
    
        UIView.ani
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
