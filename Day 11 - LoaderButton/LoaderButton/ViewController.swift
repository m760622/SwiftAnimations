//
//  ViewController.swift
//  LoaderButton
//
//  Created by Anantha Krishnan K G on 06/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var submitButton: UIButton!
    
    var layerPath: UIBezierPath!
    var backgroundLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    var originalFrame:CGRect!
    
    var timer: Timer!
    var downloadProgressTracker:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.setTitle("submit", for: UIControl.State.normal)
        submitButton.layer.cornerRadius = 25
        
        self.submitButton.setImage(UIImage(named: ""), for: .normal)
        self.submitButton.imageView?.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.submitButton.backgroundColor = UIColor.getBGColor()

    }

    @IBAction func submitButtonAction(_ sender: UIButton) {
       
        self.submitButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.submitButton.transform = .identity
            self.submitButton.setTitle("", for: UIControl.State.normal)
            self.originalFrame = self.submitButton.frame
            self.submitButton.frame = CGRect(x: self.submitButton.center.x - 30, y: self.submitButton.frame.origin.y, width: 70, height: 70)
            self.submitButton.layer.cornerRadius = 35
            
        }) { (animate) in
            UIView.animate(withDuration: 0.3, animations: {
                self.createCirclePath()
            })
        }
       
    }
    
    
    func downloadAnimation() {
        
        backgroundLayer = CAShapeLayer()
        backgroundLayer.path = layerPath.cgPath
        backgroundLayer.lineWidth = 8
        backgroundLayer.fillColor = nil
        backgroundLayer.strokeColor = UIColor.white.cgColor
       
        progressLayer = CAShapeLayer()
        progressLayer.path = layerPath.cgPath
        progressLayer.lineWidth = 8
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.strokeEnd = 0.0
        
        self.view.layer.addSublayer(backgroundLayer)
        self.view.layer.addSublayer(progressLayer)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)

    }
    
    private func createCirclePath() {
        let centerx = self.submitButton.frame.minX + 35
        let centery = self.submitButton.center.y
        layerPath = UIBezierPath()
        layerPath.addArc(withCenter: CGPoint(x: centerx, y: centery), radius: 31, startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        layerPath.close()
        downloadAnimation()
    }
    
    func reverse() {
        backgroundLayer.removeAllAnimations()
        progressLayer.removeAllAnimations()
        backgroundLayer.removeFromSuperlayer()
        progressLayer.removeFromSuperlayer()
         UIView.animate(withDuration: 0.8, animations: {
            self.submitButton.imageView?.transform = .identity
            self.submitButton.setImage(UIImage(named: "select"), for: .normal)
         }) { (animate) in
            UIView.animate(withDuration: 0.5, animations: {
                self.submitButton.setImage(UIImage(named: ""), for: .normal)
                self.submitButton.titleLabel?.transform = CGAffineTransform(scaleX: 0, y: 0 )
                self.submitButton.setTitle("Submit", for: UIControl.State.normal)
                self.submitButton.frame = self.originalFrame
                self.submitButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.submitButton.layer.cornerRadius = 25
            }) { (animate) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.submitButton.transform = .identity
                    self.submitButton.titleLabel?.transform = CGAffineTransform.identity
                })
            }
        }
    }

    
    @objc func showProgress()
    {
        if(downloadProgressTracker > 1.0){
            timer.invalidate()
            downloadProgressTracker = 0
            reverse()
        }
        downloadProgressTracker = downloadProgressTracker + 0.25
        progressLayer.strokeEnd = downloadProgressTracker
    }
    
}


extension UIColor {
    
    class func getBGColor() -> UIColor {
        
        return UIColor(red: 180.0/255.0, green: 203.0/255.0, blue: 73.0/255.0, alpha: 1.0)
    }
}
