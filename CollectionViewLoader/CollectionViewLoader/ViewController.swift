//
//  ViewController.swift
//  CollectionViewLoader
//
//  Created by Anantha Krishnan K G on 31/08/18.
//  Copyright © 2018 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    // Variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    var lowerFrameY:CGFloat = 0.0
    var upperFrameY:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 15, right: 15)
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        collectionView.collectionViewLayout = layout
        
        lowerFrameY = collectionView.bounds.height * (2/3)
        upperFrameY = view.bounds.height * (1/5)
    }

}

// Data source functions of collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
       animateCell(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.bounds.width / 2) - 20
        return CGSize(width: width, height: width + 40)
    }
    
}

extension ViewController {
    
    /**
     Animation Action
     - parameter : cell, UICollectionViewCell object
     */
    func animateCell(_ cell : UICollectionViewCell) {
        
        let cellLocation = cell.convert(cell.bounds, to: view)
        
        if cellLocation.minY >= lowerFrameY {
            animateBottomScaling(cell)
        } else if (cellLocation.minY <= upperFrameY) {
            animateTopScaling(cell)
        } else {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
    }
    
    func animateBottomScaling(_ cell:UICollectionViewCell) {
        
        let cellLocation = cell.convert(cell.bounds, to: view)
        let differenceY = (cellLocation.minY - lowerFrameY) / (collectionView.bounds.height - lowerFrameY)
        let scaleRawValue = getScaleValue(differenceY)
        
        let scaleValue = scaleRawValue * 0.2
        
        cell.transform = CGAffineTransform(scaleX: 1-scaleValue, y: 1-scaleValue)
        
    }
    
    
    func animateTopScaling(_ cell:UICollectionViewCell) {
        
        let cellLocation = cell.convert(cell.bounds, to: view)
        
        let differenceY = (upperFrameY - cellLocation.minY) / (collectionView.bounds.height - upperFrameY)
        let scaleRawValue = getScaleValue(differenceY)
        
        let scaleValue = scaleRawValue * 0.2
        
        cell.transform = CGAffineTransform(scaleX: 1 - scaleValue, y: 1 - scaleValue)
        
    }
    
    /**
     Get the scale value
     - parameter : value, scale value
     */
    func getScaleValue(_ value: CGFloat) -> CGFloat {
        
        if value < 0 {
            return 0
        } else if value > 1 {
            return 1
        }
        return value
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.visibleCells.forEach { (cell) in
            animateCell(cell)
        }
    }
    
    
}
