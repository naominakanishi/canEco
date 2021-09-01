//
//  HomeViewController.swift
//  canEco
//
//  Created by Marco Zulian on 01/09/21.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {

    let homeTitle = UILabel()
    let userName = UILabel()
    let categoryTitle = UILabel()
    let categoryButtonContainer = UIView()
    var collectionView: UICollectionView!
    let buttonMargin: CGFloat = 15
    var data: [(String, String)] = [("placeholder", "1"),("placeholder", "2"),("placeholder", "3"),("placeholder", "4")]
    lazy var tapAction: (TaskButton) -> Void = { button in
        print("Clicou no botão")
    }
    
    init () {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func displayHomeTitle(){
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeTitle)
        homeTitle.text = "Ilha do"
        homeTitle.font = UIFont.boldSystemFont(ofSize: 32)
        homeTitle.numberOfLines = 0
        homeTitle.textColor = UIColor(named: "violetColor")
        homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayUserName(){
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        userName.text = "Juliano"
        userName.font = UIFont.boldSystemFont(ofSize: 48)
        userName.numberOfLines = 0
        userName.textColor = UIColor.blue
        userName.topAnchor.constraint(equalTo: homeTitle.bottomAnchor, constant: 10).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupContainer(){
        let margin: CGFloat = 30
//        categoryButtonContainer.backgroundColor = .blue
        categoryButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryButtonContainer)
        categoryButtonContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -margin).isActive = true
        categoryButtonContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin).isActive = true
        categoryButtonContainer.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: margin).isActive = true
        categoryButtonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupExistentialCrisisButton() {
        //let margin: CGFloat = 15
        let existentialCrisisButton = TaskButton (category: .food, tapAction: tapAction)
        existentialCrisisButton.configure(imageName: "placeholder", categoryTitle: "Ir de bike pro trabalho")
        existentialCrisisButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(existentialCrisisButton)
        
        existentialCrisisButton.topAnchor.constraint(equalTo: categoryButtonContainer.topAnchor).isActive = true
        existentialCrisisButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        existentialCrisisButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.leadingAnchor).isActive = true
        existentialCrisisButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: -buttonMargin).isActive = true
    }
    
    func setupFoodieButton(){
        let foodieButton = TaskButton(category: .shopping, tapAction: tapAction)
        foodieButton.configure(imageName: "placeholder", categoryTitle: "só consigo pensar em comer e beber")
        foodieButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButtonContainer.addSubview(foodieButton)
        
        foodieButton.topAnchor.constraint(equalTo: categoryButtonContainer.topAnchor).isActive = true
        foodieButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        foodieButton.leadingAnchor.constraint(equalTo: categoryButtonContainer.centerXAnchor, constant: buttonMargin).isActive = true
        foodieButton.trailingAnchor.constraint(equalTo: categoryButtonContainer.trailingAnchor).isActive = true
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TaskButton.self, forCellWithReuseIdentifier: "cell")
        let margin: CGFloat = 30
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -margin).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin).isActive = true
        collectionView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: margin).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayHomeTitle()
        displayUserName()
        setupContainer()
//        if tem desafios {
//            setupDesafios()
//        } else {
//            setupSemDesafios()
//        }
        setupExistentialCrisisButton()
        setupFoodieButton()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView()
        // Do any additional setup after loading the view.
    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.addSubview(TaskButton(category: .fashion, tapAction: tapAction))
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}
