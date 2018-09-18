//
//  ViewController.swift
//  FloatLabelTextField
//
//  Created by Anantha Krishnan K G on 18/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameFloatLabel: UILabel!
    @IBOutlet var passwordFloatLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameFloatLabel.transform = CGAffineTransform(scaleX: 1, y: 0.001)
        passwordFloatLabel.transform = CGAffineTransform(scaleX: 1, y: 0.001)
        
        
    }
    
    


}

