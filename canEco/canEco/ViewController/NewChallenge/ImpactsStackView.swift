//
//  ImpactsStackView.swift
//  canEco
//
//  Created by Marco Zulian on 15/09/21.
//

import UIKit

class ImpactsStackView: UIStackView {

    var challenge: Challenge! {
        didSet {
            setupBenefits()
        }
    }
    
    init() {
        super.init(frame: .zero)
        spacing = frame.width * 0.8 * 0.35
        alignment = .leading
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBenefits() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
            removeArrangedSubview($0)}
        challenge?.benefits.forEach {
            let impactsView = ImpactsView(benefit: $0)
            impactsView.associetedStackView = self
            addArrangedSubview(impactsView)
        }
    }
    
}
