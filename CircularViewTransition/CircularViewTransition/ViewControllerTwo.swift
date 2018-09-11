//
//  ViewControllerTwo.swift
//  CircularViewTransition
//
//  Created by Anantha Krishnan K G on 11/09/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    @IBOutlet var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.setShadow()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func closeMenu(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
