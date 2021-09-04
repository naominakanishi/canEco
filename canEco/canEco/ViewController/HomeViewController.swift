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
    var data = [Task]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init () {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resize(itemAt indexPath: IndexPath) {
        self.collectionView.collectionViewLayout.collectionView?.performBatchUpdates({
            data[indexPath.item].isExpanded.toggle()
            self.collectionView.reloadData()
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayHomeTitle()
        displayUserName()
//        setupContainer()
//        if tem desafios {
//            setupDesafios()
//        } else {
//            setupSemDesafios()
//        }
//        setupExistentialCrisisButton()
//        setupFoodieButton()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView()
        
        data = Task.getTasks()
        // Do any additional setup after loading the view.
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
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: CustomCollectionViewLayout())
        collectionView.register(TaskButton.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        collectionView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

