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
    let island = UIImageView()
    var collectionView: UICollectionView!
    var data = [Challenge]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let tabBar = UITabBarItem(title: "Meus desafios", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        tabBarItem = tabBar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func resize(itemAt indexPath: IndexPath) {
//        self.collectionView.collectionViewLayout.collectionView?.performBatchUpdates({
//            data[indexPath.item].isExpanded.toggle()
//            self.collectionView.reloadData()
//        }, completion: nil)
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bege")
        displayIsland()
        displayHomeTitle()
        displayUserName()
        setupCollectionView()
//        setupContainer()
//        if tem desafios {
//            setupDesafios()
//        } else {
//            setupSemDesafios()
//        }
//        setupExistentialCrisisButton()
//        setupFoodieButton()
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        navigationController?.navigationBar.isHidden = true
//        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        data = Challenges.getChallenges()
        
        // Configuração da TabBar
    }
    
    func displayHomeTitle(){
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeTitle)
        
        // AttributedString pra poder customizar o espaçamento entre linhas
        let attributedString = NSMutableAttributedString(string: "ILHA DO")
        attributedString.addAttribute(.kern, value: 2.6, range: NSRange(location: 0, length: attributedString.length - 1))
        homeTitle.attributedText = attributedString
        
        homeTitle.font = UIFont.systemFont(ofSize: 20, weight: .light)
        homeTitle.numberOfLines = 0
//        homeTitle.textColor = UIColor(named: "violetColor")
//        homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func displayUserName(){
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        userName.text = "Juliano"
        userName.font = UIFont.boldSystemFont(ofSize: 40)
        userName.numberOfLines = 0
        userName.topAnchor.constraint(equalTo: homeTitle.bottomAnchor).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userName.bottomAnchor.constraint(equalTo: island.topAnchor, constant: -20).isActive = true
    }
    
    
    func displayIsland() {
        island.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(island)
        island.image = UIImage(named: "ilhaPlaceholder")
        island.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        island.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        island.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        island.widthAnchor.constraint(equalTo: island.heightAnchor, multiplier: 1.05).isActive = true
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInset = UIEdgeInsets(top: data.isEmpty ? 30 : 0, left: view.frame.width * 0.075, bottom: 0, right: view.frame.width * 0.075)
        layout.minimumInteritemSpacing = view.frame.width * 0.0375
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        collectionView.register(TaskButton.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(NewTaskButton.self, forCellWithReuseIdentifier: "cell_new")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "bege")
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        collectionView.topAnchor.constraint(equalTo: island.bottomAnchor, constant: 20).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

