//
//  ViewController.swift
//  EmitterAnimation
//
//  Created by Anantha Krishnan K G on 09/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    var emitterLayer:CAEmitterLayer!
    var cell:CAEmitterCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    func startParticles() {
        emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = self.view.center
        
        cell = CAEmitterCell()
        cell.lifetime = 10
        cell.name = "flame"
        cell.velocity = 100
        cell.scale = 0.1
        cell.scaleRange = 1.5;
        cell.emissionRange = CGFloat.pi * 2
        cell.contents = UIImage(named: "flame.png")!.cgImage
        cell.birthRate = 20
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(self.emitterLayer)
        
    }
    
    func stopAnim() {
        
        emitterLayer.setValue(0, forKeyPath: "emitterCells.flame.birthRate")
    }

    @IBAction func buttinAction(_ sender: UIButton) {
        
        button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
       
        startParticles()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
             self.button.transform = .identity
            
            
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.5
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            self.button.titleLabel?.layer.add(animation, forKey: "shake")
            
            
        }) { (completed) in
            self.stopAnim()
            //self.emitterLayer.emitterCells?.removeAll()
            //self.emitterLayer.emitterCells?.removeAll()
            //view.layer.addSublayer(self.emitterLayer)
        }
        
    }
}

