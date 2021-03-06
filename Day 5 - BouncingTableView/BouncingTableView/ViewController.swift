//
//  ViewController.swift
//  BouncingTableView
//
//  Created by Anantha Krishnan K G on 31/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Simple Table"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateCellEntry()
    }
    
    // UITableViewDataSource methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "Table row : \(indexPath.row)"
        return cell
    }
    
    
    /**
     animateCellEntry - Animates each cells entry
     */
    
    func animateCellEntry() {
        tableView.reloadData()
        
        let visibleCells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        visibleCells.forEach { (cell) in
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        
        var index = 0
        
        visibleCells.forEach { (cell) in
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0) {
            
            let visibleCells = tableView.visibleCells
            
            let indexPath:IndexPath = tableView.indexPath(for: visibleCells.last!)!
            if indexPath.row <= 98 {
                visibleCells.last?.transform = CGAffineTransform(translationX: 0, y: 20)
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    visibleCells.last?.transform = CGAffineTransform(translationX: 0, y: 0);
                },completion:nil)
                
            }
            
        }
       
    }
}

