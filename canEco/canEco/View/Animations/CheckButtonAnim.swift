//
//  CheckButtonAnum.swift
//  canEco
//
//  Created by Marco Zulian on 09/09/21.
//

import UIKit

extension UIButton {
    func performClickAnimation(completion: @escaping ((Bool) -> Void)) {
        guard let superview = self.superview else { return }
        
        let width = superview.constraints.first { $0.identifier == "Width" }
        let height = superview.constraints.first { $0.identifier == "Height" }
        let bottom = superview.constraints.first { $0.identifier == "Bottom" }
        
        height?.constant -= 8
        width?.constant -= 10
        bottom?.constant -= 4
        titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseIn, animations: {
            superview.layoutIfNeeded()
        }, completion: nil)
        
        height?.constant += 8
        width?.constant += 10
        bottom?.constant += 4
        titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        UIView.animate(withDuration: 0.3, delay: 0.15, options: .curveEaseOut, animations: {
            superview.layoutIfNeeded()
        }, completion: completion)
    }
}
