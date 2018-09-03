//
//  ViewController.swift
//  BouncingPopUps
//
//  Created by Anantha Krishnan K G on 03/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIVisualEffectView!
    @IBOutlet weak var innerContainerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var overlayView: UIVisualEffectView!
    @IBOutlet weak var headingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayView.alpha = 0
        containerView.alpha = 0
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        closeButton.layer.cornerRadius = 10
    }

    @IBAction func showPopup(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.headingLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
        
        containerView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            
            self.containerView.transform = CGAffineTransform.identity
        }) { (completion) in
            
        }
        overlayView.alpha = 1
        containerView.alpha = 1
        
    }
    @IBAction func ClosePopup(_ sender: UIButton) {
        closeAnimation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touches.first?.view == overlayView {
            closeAnimation()
        }
        
    }
    
    func closeAnimation () {
        
        
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            
            self.containerView.transform = CGAffineTransform(scaleX: 0.3, y: 0.2)
            
            self.overlayView.alpha = 0
            self.containerView.alpha = 0
             self.headingLabel.transform = CGAffineTransform.identity
            
            
        }){(completion) in
            
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
}

