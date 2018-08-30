//
//  ViewController.swift
//  CollisionAnimation
//
//  Created by Anantha Krishnan K G on 30/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    // MARK: Properties (Public)
    
    // contraints variables
    var timer = Timer()
    let viewSize:CGFloat = 300.0;
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    let itemBehavior = UIDynamicItemBehavior()
    
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create UIDynamicAnimation objects
        addAnimation()
        
        // Call the View creator Function
        scheduledTimerWithTimeInterval()
        
    }
    
    /**
     addAnimation - Creating the UIDynamicAnimation objects and adding properties
     */
    func addAnimation(){
        
        animator = UIDynamicAnimator(referenceView:self.view);
        
        gravity.gravityDirection = CGVector(dx: 0, dy: 0.6)
        animator?.addBehavior(gravity);
        
        // We're bouncin' off the walls
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)
        
        itemBehavior.friction = 0.1;
        itemBehavior.elasticity = 0.9
        animator?.addBehavior(itemBehavior)
        
    }
    
    /**
     addBoxToBehaviors - Add view to the UIDynamicAnimation objects
     - parameter :box - UIView object
     */
    func addBoxToBehaviors(box: UIView) {
        gravity.addItem(box)
        collider.addItem(box)
        itemBehavior.addItem(box)
    }

    /**
     setUp -
     - parameter :box - UIView object
     */
    @objc func createView() {
        
        let guessX = CGFloat(arc4random()).truncatingRemainder(dividingBy: view.bounds.size.width - viewSize)
        let subView = UIViewX(frame: CGRect(x: guessX, y:0 , width: viewSize, height: viewSize))
        self.view.addSubview(subView)
        self.addBoxToBehaviors(box: subView)
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.createView), userInfo: nil, repeats: true)
    }
    
}

