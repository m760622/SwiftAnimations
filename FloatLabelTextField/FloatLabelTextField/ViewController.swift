//
//  ViewController.swift
//  FloatLabelTextField
//
//  Created by Anantha Krishnan K G on 18/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var unFLoatlabelHeightC: NSLayoutConstraint!
    @IBOutlet var usernameFloatLabel: UILabel!
    @IBOutlet var passwordFloatLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameFloatLabel.transform = CGAffineTransform(scaleX: 1, y: 0)
        passwordFloatLabel.transform = CGAffineTransform(scaleX: 1, y: 0)
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 1 {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                 self.usernameFloatLabel.transform = CGAffineTransform.identity
            })
            
        } else if textField.tag == 2 {
            
        }
    }
    
    
    


}

