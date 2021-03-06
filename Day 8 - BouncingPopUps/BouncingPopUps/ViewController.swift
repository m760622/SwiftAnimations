//
//  ViewController.swift
//  BouncingPopUps
//
//  Created by Anantha Krishnan K G on 03/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variables
    @IBOutlet weak var containerView: UIVisualEffectView!
    @IBOutlet weak var innerContainerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var overlayView: UIVisualEffectView!
    @IBOutlet weak var headingLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the overlay and popup
        overlayView.alpha = 0
        containerView.alpha = 0
        
        // Set container corner radius
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        closeButton.layer.cornerRadius = 10
    }

    // Functions
    
    /**
     showPopup - Shows the pop action
     - parameter sender: Any, UIButton object
     */
    @IBAction func showPopup(_ sender: Any) {
        
        // scale the label ont he center to 0
        UIView.animate(withDuration: 0.3) {
            self.headingLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
        
        // scale the popup
        containerView.transform = CGAffineTransform(scaleX: 0.3, y: 2)
        
        // Spring Animation for making the container to original size
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            
            self.containerView.transform = CGAffineTransform.identity
            
        })
        
        // make the overlay and popup visible
        overlayView.alpha = 1
        containerView.alpha = 1
        
    }
    
    /**
     close popup animation
     - parameter sender: UIButton object
     */
    @IBAction func ClosePopup(_ sender: UIButton) {
        closeAnimation()
    }
    
    /**
     touchesBegan - calls when user taps on the screen
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // check whether the ctapped view is the overlay view
        if touches.first?.view == overlayView {
            closeAnimation()
        }
        
    }
    
    /**
     Dismiss the popup
     */
    func closeAnimation () {
        
        // scale animation for the container view
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            
            self.containerView.transform = CGAffineTransform(scaleX: 0.3, y: 0.2)
            self.overlayView.alpha = 0
            self.containerView.alpha = 0
             self.headingLabel.transform = CGAffineTransform.identity
            
            
        }){(completion) in
            
            // make the container view to original size
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
}

