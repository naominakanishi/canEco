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
    
    func setupCategoryImageView(){
        taskImageView.translatesAutoresizingMaskIntoConstraints = false
        taskImageView.layer.borderWidth = 1
        taskImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
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
        progressBar.tintColor = UIColor.black
    }
    
    func setupCategoryTitle(){
        taskTitle.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(taskTitle)
        taskTitle.font = UIFont.boldSystemFont(ofSize: 18)
        taskTitle.layer.borderWidth = 1
        taskTitle.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
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
        checkButton.setTitle("C H E C K", for: .normal)
        checkButton.setTitleColor(UIColor(named: "black"), for: .normal)
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        checkButton.layer.cornerRadius = 9
        checkButton.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        checkButton.layer.borderWidth = 2
        checkButton.setTitleColor(.white, for: .normal)
        
        // Action
        checkButton.addTarget(self, action: #selector(didClick), for: .touchUpInside)
    }
    
    @objc func didClick() {
        let task = challenge
        checkButton.performClickAnimation { _ in
            task?.completeNextStep()
            self.progressBar.completedStepCount += 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProgressBar()
        setupCategoryImageView()
        setupCheckButton()
        setupCategoryTitle()
        contentView.backgroundColor = .yellow
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(){
        guard let taskName = challenge?.name,
              let color = challenge?.category.getColor()
        else { return }
        taskImageView.image = UIImage(named: taskName)
        self.taskTitle.text = taskName
        contentView.backgroundColor = .white
        progressBar.highlightColor = color
        checkButton.backgroundColor = color
        
        
        if let stepper = challenge as? StepCounter {
            progressBar.stepCount = stepper.totalSteps
            progressBar.completedStepCount = stepper.completedSteps
        }
    }

}
