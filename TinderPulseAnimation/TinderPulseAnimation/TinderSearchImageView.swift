//
//  TinderSearchImageView.swift
//  TinderPulseAnimation
//
//  Created by Anantha Krishnan K G on 06/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class TinderSearchImageView: UIImageView {
    
    var rippleLayerFirst: CALayer?
    var rippleLayerSecond: CALayer?
    var rippleLayerThird: CALayer?
    
    var animationGroupFirst = CAAnimationGroup()
    var animationGroupSecond = CAAnimationGroup()
    var animationGroupThird = CAAnimationGroup()
    
    @IBInspectable public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUpLayer()
    }
    
    func getCALayer() -> CALayer {
        
        let rippleLayer = CALayer(layer: "")
        rippleLayer.backgroundColor = UIColor.black.cgColor
        rippleLayer.contentsScale = UIScreen.main.scale
        rippleLayer.opacity = 0
        rippleLayer.position = self.center
        rippleLayer.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        rippleLayer.cornerRadius = 100
        
        return rippleLayer
    }
    
    func getCAAnimationGroup(_ count:Double) -> CAAnimationGroup {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 2)
        scaleAnimation.duration = 1.2
        
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = 1.2
        opacityAnimation.values = [0.3, 0.5, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2, 0.6, 1]
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1.2
        animationGroup.repeatCount = Float.infinity
        animationGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animationGroup.animations = [scaleAnimation, opacityAnimation]
        animationGroup.beginTime = CACurrentMediaTime() + count
        
        return animationGroup
    }
    
    func setUpLayer() {
        rippleLayerFirst = getCALayer()
        rippleLayerSecond = getCALayer()
        rippleLayerThird = getCALayer()
        
        animationGroupFirst = getCAAnimationGroup(0.0)
        animationGroupSecond = getCAAnimationGroup(0.6)
        animationGroupThird = getCAAnimationGroup(1.2)
        
    }
    
    func initRippleAnimation() {
        
        self.rippleLayerFirst?.add(self.animationGroupFirst, forKey: "pulse")
        self.rippleLayerFirst?.backgroundColor = UIColor.blue.cgColor
        self.rippleLayerFirst?.repeatCount = Float.infinity
        self.superview?.layer.insertSublayer(self.rippleLayerFirst!, below: self.layer)
        
        self.rippleLayerSecond?.add(self.animationGroupSecond, forKey: "pulse")
        self.rippleLayerSecond?.backgroundColor = UIColor.blue.cgColor
        self.rippleLayerSecond?.repeatCount = Float.infinity
        self.superview?.layer.insertSublayer(self.rippleLayerSecond!, below: self.layer)
        
        self.rippleLayerThird?.add(self.animationGroupThird, forKey: "pulse")
        self.rippleLayerThird?.backgroundColor = UIColor.blue.cgColor
        self.rippleLayerThird?.repeatCount = Float.infinity
        self.superview?.layer.insertSublayer(self.rippleLayerThird!, below: self.layer)
    }
    
}

