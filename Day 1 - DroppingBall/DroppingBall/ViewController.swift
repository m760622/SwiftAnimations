//
//  ViewController.swift
//  DroppingBall
//
//  Created by Anantha Krishnan K G on 27/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: Properties
    @IBOutlet var pinkBall: UIView!
    @IBOutlet var greenBall: UIView!
    @IBOutlet var yellowBall: UIView!
    @IBOutlet var reloadButton: UIButton!

    var bounceAnimator: UIViewPropertyAnimator?
    
    
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView();
    }
    
    
    /**
     Initial setting up for the Views
     */
    func setUpView() {
        
        
        //Corner Radius for Views
        pinkBall.layer.cornerRadius = pinkBall.frame.width/2
        greenBall.layer.cornerRadius = greenBall.frame.width/2
        yellowBall.layer.cornerRadius = yellowBall.frame.width/2
        
        // Add constraints
        pinkBall.translatesAutoresizingMaskIntoConstraints = false
        greenBall.translatesAutoresizingMaskIntoConstraints = false
        yellowBall.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.alpha = 0;
        
        let constarins = [
            
            pinkBall.heightAnchor.constraint(equalToConstant: 80),
            greenBall.heightAnchor.constraint(equalToConstant: 80),
            yellowBall.heightAnchor.constraint(equalToConstant: 80),
            pinkBall.widthAnchor.constraint(equalToConstant: 80),
            greenBall.widthAnchor.constraint(equalToConstant: 80),
            yellowBall.widthAnchor.constraint(equalToConstant: 80),
            greenBall.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            greenBall.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pinkBall.centerXAnchor.constraint(equalTo: self.greenBall.centerXAnchor,constant: -109),
            pinkBall.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            yellowBall.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 109),
            yellowBall.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        
        ]
        
        // Adding constrains for UIViews
        addConstrains(constrainsts: constarins)
        
        // Call Pulsating Animation
        startPulseAnimation()
        
        //Calling strech animation after a delay
        perform(#selector(startStretchAnimation), with: nil, afterDelay: 5)
    }
    
    
    /**
     Adds constraints for the given views.
     
     - parameter constrainsts: array of NSLayoutConstraint
     */
    func addConstrains(constrainsts:[NSLayoutConstraint]) {
        
        NSLayoutConstraint.activate(constrainsts)
    }
    
    
    /**
     
     Code for starting the Stretching Animation
     */
    @objc func startStretchAnimation() {
        
        let pinkBallDx:CGFloat = 40
        let greenBallDx:CGFloat =  0
        let yellowBallDx:CGFloat = 40
        
        let pinkBallDy:CGFloat = (self.view.frame.height / 2) - 80
        let greenBallDy:CGFloat = (self.view.frame.height / 2) - 80
        let yellowBallDy:CGFloat = (self.view.frame.height / 2) - 80

        let animator = UIViewPropertyAnimator(duration: 2.5, curve: .easeOut) {
            
            self.pinkBall.frame = self.pinkBall.frame.offsetBy(dx: -pinkBallDx, dy: -pinkBallDy)
            self.greenBall.frame = self.greenBall.frame.offsetBy(dx: greenBallDx, dy: -greenBallDy)
            self.yellowBall.frame = self.yellowBall.frame.offsetBy(dx: yellowBallDx, dy: -yellowBallDy)
        }
        
        animator.startAnimation()
        
        animator.addCompletion {
            position in
            switch position {
            case .end:
                print("Completion handler called at end of animation")
                self.removeAllAnimations()
                break
            case .current: print("Completion handler called mid-way through animation")
            case .start: print("Completion handler called  at start of animation")
            }
        }
    }
    
    
    /**
     Code for starting the Pulsating Animation
     */
    func startPulseAnimation() {
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat,.autoreverse,.curveEaseInOut], animations: {
            self.pinkBall.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.greenBall.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.yellowBall.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { (completion) in
            self.pinkBall.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.greenBall.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.yellowBall.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        
    }
    
    /**
     Remove all animations from UIViews
     */
    func removeAllAnimations() {
        self.pinkBall.layer.removeAllAnimations()
        self.yellowBall.layer.removeAllAnimations()
        self.greenBall.layer.removeAllAnimations()
        
        startBounceAnimation()
    }
    
    
    /**
     Code for starting the Bouncing Animation
     */
    func startBounceAnimation() {
        let dampingDY:CGFloat = self.view.bounds.height/2 - 80
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .curveEaseInOut, animations: {
            self.pinkBall.frame = self.pinkBall.frame.offsetBy(dx: 29, dy: dampingDY)
            self.greenBall.frame = self.greenBall.frame.offsetBy(dx: 0, dy: dampingDY)
            self.yellowBall.frame = self.yellowBall.frame.offsetBy(dx: -29, dy: dampingDY)
        }, completion: { (completion) in
            self.startPulseAnimation()
            UIView.animate(withDuration: 1.0, animations: {
                self.reloadButton.alpha = 1.0
            })
        })
    }
    
    /**
     Action to restart the animation
     */
    @IBAction func reloadAction(_ sender: UIButton) {
        
        
        let roationAnimation = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) {
            for _ in 0..<20 {
                let rotaion = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.reloadButton.transform = self.reloadButton.transform.concatenating(rotaion)
            }
        }
        roationAnimation.startAnimation()
        roationAnimation.addCompletion {
            completion in
            if completion == .end {
                self.reloadButton.alpha = 0
                self.startStretchAnimation()
            }
        }
    }
}

