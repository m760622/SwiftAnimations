//
//  ViewController.swift
//  TinderPulseAnimation
//
//  Created by Anantha Krishnan K G on 05/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var segmentedController: UISegmentedControl!
    @IBOutlet var searchingImageView: TinderSearchImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchingImageView.initRippleAnimation()
    }

    @IBAction func selectionAction(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            
            segmentedController.setImage(UIImage(named: "Group 1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 0)
            segmentedController.setImage(UIImage(named: "Group 4")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 1)
            break
        case 1:
            segmentedController.setImage(UIImage(named: "Group 2")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 0)
            segmentedController.setImage(UIImage(named: "Group 3")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 1)
            break
        default:
            print("no actions")
        }
    }
    
}

