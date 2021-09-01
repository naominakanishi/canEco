//
//  CategoryButton.swift
//  BuzzFeed4U
//
//  Created by Naomi Nakanishi - Marco Zulian on 01/09/21.
//

import UIKit

class TaskButton: UIView {
    
    let categoryImageView = UIImageView()
    let categoryTitle = UILabel()
    let checkButton = UIButton()
    let progressBar = UIProgressView()
    let category: Category
    let tapAction: (TaskButton) -> Void
    
    func setupCategoryImageView(){
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryImageView)
        categoryImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        categoryImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        categoryImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        categoryImageView.heightAnchor.constraint(equalTo: categoryImageView.widthAnchor, multiplier: 1 ).isActive = true
    }
    
    func setupProgressBar(){
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        progressBar.progress = 0.5
        progressBar.tintColor = UIColor.green
    }
    
    func setupCategoryTitle(){
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(categoryTitle)
        categoryTitle.font = UIFont.boldSystemFont(ofSize: 18)
        categoryTitle.tintColor = UIColor(named: "darkGreyColor")
        categoryTitle.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10).isActive = true
        categoryTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        categoryTitle.textAlignment = .center
        categoryTitle.numberOfLines = 0
    }
    
    func setupCheckButton(){
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(checkButton)
        checkButton.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 10).isActive = true
        checkButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        checkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        checkButton.setTitle("Check In", for: .normal)
        checkButton.layer.cornerRadius = 20
        checkButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        checkButton.layer.borderWidth = 1
    }
    
    func setupNextGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(gesture)
    }
    
    
    @objc func handleTapGesture(){
        print("ta clicando fia")
        tapAction(self)
    }
    
    init(category: Category, tapAction: @escaping (TaskButton) -> Void){
        self.category = category
        self.tapAction = tapAction
        super.init(frame: .zero)
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor.lightGray
    
        setupCategoryImageView()
        setupProgressBar()
        setupCategoryTitle()
        setupCheckButton()
        setupNextGesture()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (imageName: String, categoryTitle: String){
        categoryImageView.image = UIImage(named: imageName)
        self.categoryTitle.text = categoryTitle
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
