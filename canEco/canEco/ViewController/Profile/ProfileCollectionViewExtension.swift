//
//  ProfileCollectionViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = impactCount.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImpactCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = impactCount.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! ImpactHeaderCollectionReusableView
        header.headerButton.addTarget(self, action: #selector(cvButtonAction), for: .touchUpInside)
        return header
    }
    
    @objc func cvButtonAction() {
        let navVc = UINavigationController(rootViewController: InfoViewController())
        navVc.modalPresentationStyle = .fullScreen
        
        present(navVc, animated: true)
        navigationController?.pushViewController(InfoViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 3
        let widthMultiplier: CGFloat = 1
        
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let insets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - insets
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width * widthMultiplier
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print(collectionView.frame.width)
        return CGSize(width: collectionView.frame.width, height: 48)
    }
    
}
