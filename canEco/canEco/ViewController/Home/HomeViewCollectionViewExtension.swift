//
//  HomeViewCollectionViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 02/09/21.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, MyCollectionViewCellDelegate {
    
    func didTapButton(_ sender: UICollectionViewCell) {
        let indexPath = collectionView.indexPath(for: sender)!
        collectionView.performBatchUpdates( {
            collectionView.deleteItems(at: [indexPath])
            if self.data.count == 0 {
                self.collectionView.reloadItems(at: [IndexPath(item: 1, section: 0)])
            }
        }, completion: nil)
        if let island = island as? IslandView {
            island.setupIsland()
        }
    }
    
    // Quantos elementos
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    // Como cada elemento deve ser mostrado
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < data.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChallengeCell
            cell.challenge = data[indexPath.item]
            cell.delegate = self
            if cell.challenge!.isComplete {
                cell.changeCellColor()
            }
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
        return CGSize(width: collectionView.frame.width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == data.count {
            tabBarController?.selectedIndex = 1
        } else {
            let vc = OpenCardViewController(challenge: data[indexPath.item])
            vc.challengeDelegate = self
            present(vc, animated: true, completion: nil)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let speed = scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y
        let displacement = speed * 0.016666
        
        if speed != 0.0 {
            print("Pan \(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y) Off \(scrollView.contentOffset.y) Speed \(speed) Displacement \(displacement)")
        }

//        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y >= 0 &&
//            scrollView.contentOffset.y < 0 &&
//            isCollectionViewMaximized {
//            isCollectionViewMaximized.toggle()
//            performCollectionViewRedutionAnimation(withSpeed: speed, andDeceleration: displacement)
//        }
//        else
//        if scrollView.contentOffset.y > 0 &&
//                scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0
////            &&
////                !isCollectionViewMaximized
//        {
//            isCollectionViewMaximized.toggle()
//        if data.count > 4 {
//            performCollectionViewAnimation(withSpeed: speed, andDeceleration: displacement)
//        }
//        }
    }
}
