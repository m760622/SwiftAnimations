//
//  ViewController.swift
//  PopTableViewAnimation
//
//  Created by Anantha Krishnan K G on 31/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        addAnimation()
    }

    
    // UITableViewDataSource methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Bold", size:20)
        cell.textLabel?.text = "Table row : \(indexPath.row)"
        cell.textLabel?.textAlignment = .center
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let cell = tableView.cellForRow(at: indexPath)
            scaleCell(cell)
            break
        case 1:
            let cell = tableView.cellForRow(at: indexPath)
            cell?.textLabel?.transform = CGAffineTransform(scaleX: 0.3, y: 1.0)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell?.textLabel?.transform = .identity
                self.addLabel()
            })
            
            break
        default:
            print("Unknown")
        }
    }
    
    func scaleCell(_ cell: UITableViewCell?) {
        
        cell?.textLabel?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            cell?.textLabel?.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell?.textLabel?.transform = .identity
            })
        })
    }
    
    func addLabel() {
        
        tableView.visibleCells.forEach { (cell) in
            
            let guessX = CGFloat(arc4random()).truncatingRemainder(dividingBy:cell.center.y)

            cell.frame = CGRect(x: guessX, y: cell.center.y, width: 70, height: 70)
            cell.layer.cornerRadius = 35
            cell.backgroundColor = UIColor.green
            UIView.animate(withDuration: 0.3,delay:0.3, animations: {
                self.addBoxToBehaviors(cell)
            })
        }
        
        
        
        
        
    }
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    let itemBehavior = UIDynamicItemBehavior()
    
    func addAnimation(){
        
        animator = UIDynamicAnimator(referenceView:self.view);
        
       gravity.gravityDirection = CGVector(dx: 0.0, dy: 0.6)
        animator?.addBehavior(gravity);
        
        // We're bouncin' off the walls
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)
        
        itemBehavior.friction = 0.1;
        itemBehavior.elasticity = 0.9
        animator?.addBehavior(itemBehavior)
        
    }
    
    /**
     addBoxToBehaviors - Add cells to the animator
     - parameter cell: uitableCell object
     */
    func addBoxToBehaviors(_ cell: UIDynamicItem) {
        gravity.addItem(cell)
        collider.addItem(cell)
        itemBehavior.addItem(cell)
    }

}

