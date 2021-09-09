//
//  HomeViewAnim.swift
//  canEco
//
//  Created by Marco Zulian on 09/09/21.
//

import UIKit

extension HomeViewController {
    
    func performCollectionViewAnimation(withSpeed speed: CGFloat, andDeceleration displacement: CGFloat) {
        guard let view = view else { return }
        let viewWidth = view.frame.width
        let newHeight = view.frame.height * minHeightProportion
        let newWidth = newHeight * aspectRatio
        let labelWidth = titleLabelSize
        let maxValue = (-view.frame.height / 2 + newHeight / 2 + distanceToTop)
        let maxDisplacement = abs(yDistanceToCenter - maxValue)
        let percentualDisplacement = min(1, collectionView.contentOffset.y / (2 * maxDisplacement))

        // Island displacement
        let islandHeight = view.constraints.first { $0.identifier == "IslandHeight" }
        let islandXPosition = view.constraints.first { $0.identifier == "IslandCenterX" }
        let islandYPosition = view.constraints.first { $0.identifier == "IslandCenterY" }
    
        islandHeight?.constant = (-view.frame.height * (maxHeightProportion - minHeightProportion)) * percentualDisplacement
        islandXPosition?.constant = (view.frame.width / 2 - newWidth / 2 - view.frame.width * borderSpacingProportion) * percentualDisplacement
        islandYPosition?.constant = yDistanceToCenter + (-view.frame.height / 2 + newHeight / 2 + distanceToTop - yDistanceToCenter) * percentualDisplacement
        
        // Title label displacement
        let labelXPosition = view.constraints.first { $0.identifier == "labelCenterX" }
        let labelYPosition = view.constraints.first { $0.identifier == "labelCenterY" }
        
        labelXPosition?.constant = (-viewWidth/2 + labelWidth!/2 + viewWidth * borderSpacingProportion) * percentualDisplacement
        labelYPosition?.constant = distanceToTop + (newHeight/2) * percentualDisplacement
            
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseIn, animations: {
            view.layoutIfNeeded()
        }, completion: nil)
    }
}
