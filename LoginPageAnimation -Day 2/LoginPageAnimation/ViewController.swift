//
//  ViewController.swift
//  LoginPageAnimation
//
//  Created by Anantha Krishnan K G on 28/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties (Public)
    
    // contraints variables
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var forgotPassWordLabel: UILabel!
    @IBOutlet weak var signupLabelStack: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var imageContentXContraints: NSLayoutConstraint!
    @IBOutlet weak var imageContentYContraints: NSLayoutConstraint!
    @IBOutlet weak var loginButtonYConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageWidthConstraints: NSLayoutConstraint!
    @IBOutlet weak var logoImageHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var emailLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var passwordLabelHeight: NSLayoutConstraint!

    var loginHasShown = false
    
    // MARK: Animators
    
    
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpViews()
    }
    
    /**
     Setup animations and views
     */
    func setUpViews() {
        
        loginButton.layer.shadowColor = UIColor.darkGray.cgColor
        loginButton.layer.shadowRadius = 2.0
        loginButton.layer.shadowOpacity = 0.25
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 6)
        loginButton.layer.cornerRadius = 2.5
        
        
        let animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.imageContentYContraints.constant -= 200
            self.logoLabel.alpha = 0
            self.welcomeLabel.alpha = 1
            self.loginButtonYConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
        animator.addCompletion {
            position in
            switch position {
            case .end:
                print("Completion handler called at end of animation")
               // self.removeAllAnimations()
                break
            case .current: print("Completion handler called mid-way through animation")
            case .start: print("Completion handler called  at start of animation")
            }
        }
    }
    
    /**
     Hides the keyboard
     */
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /**
     Login button click action
     */
    @IBAction func LoginAction(_ sender: Any) {
        
        if !loginHasShown {
             loginAnimation();
            loginHasShown.toggle()
        }
    }
    
    
    /**
     Animate the first login button click
     */
    func loginAnimation() {
        
        let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
            self.imageContentYContraints.constant -= 20
            self.welcomeLabel.alpha = 0
            self.loginLabel.alpha = 1
            self.signupLabelStack.alpha = 0
            self.forgotPassWordLabel.alpha = 1
            self.loginButtonYConstraint.constant = 270
            self.logoImageWidthConstraints.constant = 80
            self.logoImageHeightConstraints.constant = 90
            self.emailLabelHeight.constant = 70
            self.passwordLabelHeight.constant = 70
            
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
        animator.addCompletion {
            position in
            switch position {
            case .end:
                print("Completion handler called at end of animation")
                // self.removeAllAnimations()
                break
            case .current: print("Completion handler called mid-way through animation")
            case .start: print("Completion handler called  at start of animation")
            }
        }
    }
    
    
}

