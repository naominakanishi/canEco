//
//  CategoryButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi - Marco Zulian on 01/09/21.
//

import UIKit

class ChallengeCell: UICollectionViewCell {
    
    var challenge: Challenge? {
        didSet {
            configureCell()
        }
    }
    let taskImageView = UIImageView()
    let taskTitle = UILabel()
    let checkButton = UIButton()
    let progressBar = ProgressBar()
    weak var delegate: MyCollectionViewCellDelegate?
    
    func setupCategoryImageView(){
        taskImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(taskImageView)
        taskImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        taskImageView.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -20).isActive = true
        taskImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.24).isActive = true
        taskImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.24 * 1.82).isActive = true

    }
    
    func setupProgressBar(){
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(progressBar)
        progressBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 6).isActive = true
        progressBar.tintColor = UIColor(named: "black")
    }
    
    func setupCategoryTitle(){
        taskTitle.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(taskTitle)
        taskTitle.font = UIFont.boldSystemFont(ofSize: 18)

        // Constraints
        taskTitle.centerYAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 30).isActive = true
        taskTitle.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor).isActive = true
        taskTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        // Appearance
        taskTitle.textColor = UIColor(named: "black")
        taskTitle.textAlignment = .left
        taskTitle.numberOfLines = 0
        checkButton.setTitleColor(.black, for: .normal)
    }
    
    func setupCheckButton(){
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(checkButton)
        // Constraints
        let bottomConstraint = checkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        bottomConstraint.identifier = "Bottom"
        bottomConstraint.isActive = true
        let widthConstraint = checkButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        widthConstraint.identifier = "Width"
        widthConstraint.isActive = true
        let heightConstraint = checkButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.17)
        heightConstraint.identifier = "Height"
        heightConstraint.isActive = true
        checkButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        // Appearance
        checkButton.setTitle("C H E C K - I N", for: .normal)
        checkButton.titleLabel?.font = UIFont(name: "Ubuntu-Medium", size: 14)
        checkButton.layer.cornerRadius = 9
        checkButton.setTitleColor(.white, for: .normal)
        
        // Action
        checkButton.addTarget(self, action: #selector(didClick), for: .touchUpInside)
    }
    
    @objc func didClick() {
        if challenge!.isComplete && challenge!.isWaitingConfirmation {
            User.shared.progress(in: self.challenge!)
            if let del = (self.delegate as? HomeViewController) {
                del.didTapButton(self)
            }
            return
        }
        User.shared.progress(in: self.challenge!)
        
        checkButton.performClickAnimation { _ in
            UIView.animate(withDuration: 0.1, animations: {self.progressBar.completedStepCount += 1}) {_ in
                    if self.challenge!.isComplete {
                        self.changeCellColor()
                    }
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressBar()
        setupCategoryImageView()
        setupCheckButton()
        setupCategoryTitle()
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeCellColor() {
        guard let color = challenge?.category.getColor(),
              let taskImage = challenge?.imageName
        else { return }
        UIView.animate(withDuration: 0.1) {
            self.taskImageView.image = UIImage(named: taskImage+"-white")
            self.contentView.backgroundColor = color
            self.taskTitle.textColor = .white
            self.checkButton.backgroundColor = .white
            self.checkButton.setTitle("F I N A L I Z A R", for: .normal)
            self.progressBar.highlightColor = .white
        }
        
    }
    
    func configureCell(){
        guard let taskName = challenge?.name,
              let color = challenge?.category.getColor(),
              let taskImage = challenge?.imageName,
              let isComplete = challenge?.isComplete
        else { return }
        taskImageView.image = UIImage(named: taskImage)
        self.taskTitle.text = taskName
        contentView.backgroundColor = .white
        progressBar.highlightColor = color
        checkButton.backgroundColor = color
        self.taskTitle.textColor = isComplete ? .white : .black
        
        
        if let stepper = challenge as? StepCounter {
            progressBar.stepCount = stepper.totalSteps
            progressBar.completedStepCount = stepper.completedSteps
        }
    }

}

protocol MyCollectionViewCellDelegate: AnyObject {
    func didTapButton(_ sender: UICollectionViewCell)
}
