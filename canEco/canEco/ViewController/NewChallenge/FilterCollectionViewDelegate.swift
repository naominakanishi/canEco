//
//  ChallengeCollectionViewDelegate.swift
//  canEco
//
//  Created by Marco Zulian on 14/09/21.
//

import UIKit

class FilterCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    var data: [Category?] = [nil, Category.fashion, Category.food, Category.shopping, Category.transportation, Category.waste]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterTag", for: indexPath) as! CategoryTagCollectionViewCell
        cell.category = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = collectionView.frame.height
        let width: CGFloat!
        
        if data[indexPath.item] != nil {
            width = data[indexPath.item]!.rawValue.width(withConstrainedHeight: height, font: UIFont.systemFont(ofSize: 16, weight: .regular))
        } else {
            width = "TODOS".width(withConstrainedHeight: height, font: UIFont.systemFont(ofSize: 16, weight: .regular))
        }
        return CGSize(width: width + 30, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as! CategoryTagCollectionViewCell
        
        if cell.displayMode == .fill {
            cell.displayMode = .unfill
        } else {
            cell.displayMode = .fill
        }
    }
}
