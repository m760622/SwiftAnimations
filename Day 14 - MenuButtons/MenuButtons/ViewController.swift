//
//  ViewController.swift
//  MenuButtons
//
//  Created by Anantha Krishnan K G on 13/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var isShown:Bool = false
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var subButton1: UIButton!
    @IBOutlet var subButton2: UIButton!
    @IBOutlet var subButton3: UIButton!
    @IBOutlet var containerView: UIView!
    @IBOutlet var bottombar: UIView!
    
    var center1:CGPoint!
    var center2:CGPoint!
    var center3:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.setShadow()
        subButton1.setShadow()
        subButton2.setShadow()
        subButton3.setShadow()
        setUpMenu()
    }
    

    func setUpMenu() {
        
        containerView.layer.backgroundColor = UIColor.clear.cgColor
        containerView.center = mainButton.center
        containerView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.view.bringSubviewToFront(mainButton)
        
        center1 = subButton1.center
        center2 = subButton2.center
        center3 = subButton3.center
        
        subButton1.center = mainButton.center
        subButton2.center = mainButton.center
        subButton3.center = mainButton.center
        
        self.subButton1.alpha = 0.001
        self.subButton2.alpha = 0.001
        self.subButton3.alpha = 0.001
        
        mainButton.transform = CGAffineTransform(translationX: 0, y: 20)
    }
    
    
    @IBAction func buttonClickAction(_ sender: UIButton) {
         self.isShown.toggle()
        if !isShown {
            
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                
                self.subButton3.center = self.mainButton.center
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: {
                    
                    self.subButton2.center = self.mainButton.center
                    UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseInOut, animations: {
                        
                        self.subButton1.center = self.mainButton.center
                        self.subButton1.alpha = 0.001
                        self.subButton2.alpha = 0.001
                        self.subButton3.alpha = 0.001
                        
                         UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut, animations: {
                            self.containerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                            self.mainButton.transform = CGAffineTransform(translationX: 0, y: 20)
                        })
                    })
                })
            })
            
        } else {
            
            self.subButton1.alpha = 1
            self.subButton2.alpha = 1
            self.subButton3.alpha = 1
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.mainButton.transform = CGAffineTransform.identity
                let color:UIColor = self.isShown ? UIColor.lightGray : UIColor.clear
                self.containerView.layer.backgroundColor = color.cgColor
                self.containerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                 UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    
                     self.subButton1.center = self.center1
                    UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                        self.subButton2.center = self.center2
                        UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0,options: .curveEaseIn, animations: {
                            self.subButton3.center = self.center3
                            
                        })
                    })
                })
                
            })
        }
    }
    
}


extension UIButton {
    
    func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.5
    }
}

extension UIColor {
    
    class func getBGColor() -> UIColor {
        return UIColor(red: 239.0/255.0, green: 69.0/255.0, blue: 106.0/255.0, alpha: 1.0)
    }
}
