//
//  HomeViewCollectionViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 02/09/21.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // Quantos elementos
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    // Como cada elemento deve ser mostrado
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < data.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TaskButton
            cell.task = data[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_new", for: indexPath) as! NewTaskButton
            return cell
        }
    }
    
    // Tamanho de cada elemento
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat
        let widthMultiplier: CGFloat
        
        if data.isEmpty {
            columns = 1
            widthMultiplier = 0.42
        }
        else {
            columns = 2
            widthMultiplier = 1.38
        }
        
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let insets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - insets
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width * widthMultiplier
        return CGSize(width: width, height: height)
    }
    
    // Como header deve ser mostrado
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                   withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
        let size = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 53)
        
        if data.isEmpty {
            view.setupLabel(withText: "Revigore sua ilha!", andSize: size)
        } else {
            view.setupLabel(withText: "Desafios ativos", andSize: size)
        }
        return view
    }
    
    // Tamanho do header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print(collectionView.frame.width)
        return CGSize(width: collectionView.frame.width, height: 53)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == data.count {
            tabBarController?.selectedIndex = 1
        }
    }
    
}
