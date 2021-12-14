//
//  NewTaskButton.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class NewTaskButton: UICollectionViewCell {
    
    // TODO: Ajustar clipToBounds (está escondendo um pouco do pontilhado)
    var dashBorder: CAShapeLayer!
    var label = UILabel()
    var plusIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        
        setupBorder()
        setupPlusIcon()
        setupLabel()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        dashBorder.removeFromSuperlayer()
        setupBorder()
    }
    
    func setupBorder() {
        dashBorder = CAShapeLayer()
        dashBorder.lineWidth = 1
        dashBorder.strokeColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        dashBorder.lineDashPattern = [10, 8] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
        self.contentView.layer.addSublayer(dashBorder)
    }
    
    func setupLabel() {
        //TODO: Adicionar fonte Work Sans 16pts ao texto
        label.text = "Adicione novo desafio"
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.5 + 20).isActive = true
    }
    
    func setupPlusIcon() {
        plusIcon.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(plusIcon)
        plusIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        plusIcon.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.5 - 20).isActive = true
        plusIcon.widthAnchor.constraint(equalToConstant: 22).isActive = true
        plusIcon.heightAnchor.constraint(equalToConstant: 22).isActive = true
        plusIcon.image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        plusIcon.tintColor = UIColor(named: "black")
    }
}
