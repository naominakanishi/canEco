//
//  CategoryButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi - Marco Zulian on 01/09/21.
//

import UIKit

class TaskButton: UICollectionViewCell {
    
    var task: Challenge? {
        didSet {
            configureCell(for: task!.name)
        }
    }
    let taskImageView = UIImageView()
    let taskTitle = UILabel()
    let checkButton = UIButton()
    let progressBar = UIProgressView()
    
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
        progressBar.progress = 0.5
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
        taskTitle.tintColor = UIColor(named: "black")
        taskTitle.textAlignment = .left
        taskTitle.numberOfLines = 0
        checkButton.setTitleColor(.black, for: .normal)
    }
    
    func setupCheckButton(){
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(checkButton)
        // Constraints
        checkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        checkButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        checkButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.17).isActive = true
        
        // Appearance
        checkButton.setTitle("C H E C K", for: .normal)
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        checkButton.layer.cornerRadius = 9
        checkButton.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        checkButton.layer.borderWidth = 2
        checkButton.setTitleColor(.white, for: .normal)
        
        // Action
//        checkButton.addTarget(self, action: #selector(functionAction), for: .touchUpInside)
    }
    
//    @objc
//    func functionAction() {
//        task?.completedSteps += 1
////        task?.isExpanded.toggle()
//        progressBar.progress = task!.completedSteps / task!.totalSteps
//    }
    

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
    
    func configureCell(for taskName: String){
        taskImageView.image = UIImage(named: taskName)
        self.taskTitle.text = taskName
//        progressBar.progress = task!.completedSteps / task!.totalSteps
        contentView.backgroundColor = task?.category.getColor()
    }

}
