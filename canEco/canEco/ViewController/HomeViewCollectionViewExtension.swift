//
//  HomeViewCollectionViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 02/09/21.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TaskButton
        cell.task = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let task = data[indexPath.item]
        var columns: CGFloat
        var widthMultiplier: CGFloat
        if task.isExpanded {
            columns = 1
            widthMultiplier = 0.8
        }
        else {
            columns = 2
            widthMultiplier = 1.38
        }
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width * widthMultiplier
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resize(itemAt: indexPath)
    }
}
