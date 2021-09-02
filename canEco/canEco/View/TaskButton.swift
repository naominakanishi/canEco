//
//  CategoryButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi - Marco Zulian on 01/09/21.
//

import UIKit

class TaskButton: UICollectionViewCell {
    
    var task: Task? {
        didSet {
            configureCell(for: task!.name)
            contentView.updateConstraintsIfNeeded()
        }
    }
    let taskImageView = UIImageView()
    let taskTitle = UILabel()
    let checkButton = UIButton()
    let progressBar = UIProgressView()
    
    func setupCategoryImageView(){
        taskImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(taskImageView)
        taskImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        taskImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        taskImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        taskImageView.heightAnchor.constraint(equalTo: taskImageView.widthAnchor, multiplier: 1 ).isActive = true
    }
    
    func setupProgressBar(){
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: taskImageView.bottomAnchor, constant: 10).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        progressBar.progress = 0.5
        progressBar.tintColor = UIColor.green
    }
    
    func setupCategoryTitle(){
        taskTitle.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(taskTitle)
        taskTitle.font = UIFont.boldSystemFont(ofSize: 18)
        taskTitle.tintColor = UIColor(named: "darkGreyColor")
        taskTitle.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10).isActive = true
        taskTitle.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        taskTitle.textAlignment = .center
        taskTitle.numberOfLines = 0
        checkButton.setTitleColor(.black, for: .normal)
    }
    
    func setupCheckButton(){
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(checkButton)
        checkButton.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 10).isActive = true
        checkButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        checkButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        checkButton.setTitle("Check In", for: .normal)
        checkButton.layer.cornerRadius = 20
        checkButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        checkButton.layer.borderWidth = 1
        checkButton.setTitleColor(.black, for: .normal)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCategoryImageView()
        setupProgressBar()
        setupCategoryTitle()
        setupCheckButton()
        contentView.backgroundColor = .yellow
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(for taskName: String){
        taskImageView.image = UIImage(named: taskName)
        self.taskTitle.text = taskName
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
