//
//  NewChallengeViewControlerExtension.swift
//  canEco
//
//  Created by Marco Zulian on 14/09/21.
//

import UIKit

extension NewChallengeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "challengeCard", for: indexPath) as! CardCollectionViewCell
        cell.challenge = data2[indexPath.item]
        cell.navigateToOpenCard = navigateToOpenCard
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width * 0.83, height: view.frame.height * 0.53)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let challenge = data2[indexPath.item]
        navigateToOpenCard(challenge: challenge)
        return
    }
    
    private func navigateToOpenCard(challenge: Challenge) {
        let controller = OpenCardViewController(challenge: challenge)
        navigationController?.present(controller, animated: true)
    }
}
