//
//  ViewController.swift
//  FlipTransitionAnimation
//
//  Created by Anantha Krishnan K G on 04/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet var actionButtons: [UIButton]!
    var trasition = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     Button actions
     */
    @IBAction func chnegViewAction(_ sender: UIButton) {
        
        // toggle the transition for slecting the views
        trasition.toggle()
        let fromView:UIView = trasition ? view1 : view2
        let toView:UIView = trasition ? view2 : view1
        var transition:UIView.AnimationOptions = [UIView.AnimationOptions.showHideTransitionViews]
        
        switch sender.tag {
        case 1:
            transition.update(with: UIView.AnimationOptions.transitionCurlUp)
            break
        case 2:
            transition.update(with:UIView.AnimationOptions.transitionFlipFromRight)
            break
        case 3:
            transition.update(with:UIView.AnimationOptions.transitionCrossDissolve)
            break
        default:
            transition.update(with:UIView.AnimationOptions.transitionCrossDissolve)
        }

        UIView.transition(from: fromView, to: toView, duration: 0.50, options: transition) { (completion) in
            
        }
    }
    
    
    func setUp() {
        
        actionButtons.forEach { (button) in
            button.layer.cornerRadius = 11
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowOpacity = 1.0
        }
        
        view2.layer.cornerRadius = 11
        view1.layer.cornerRadius = 11
       
        
        
    }
    

}

