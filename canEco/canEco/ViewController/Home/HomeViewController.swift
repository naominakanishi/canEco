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
    var island = UIView()
    var collectionView: UICollectionView!
    var titleLabelSize: CGFloat!
    var data: [Challenge] {
        get {
            User.shared.ongoingChallenges
        }
        set {
            collectionView.reloadData()
            setupCollectionView()
        }
    }
    var isCollectionViewMaximized = false
    var collectionViewYOrigin: CGFloat!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let tabBar = UITabBarItem(title: "Meus desafios", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        tabBarItem = tabBar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bege")
        titleLabelSize = "Juliano".width(withConstrainedHeight: 1000, font: UIFont.boldSystemFont(ofSize: userNameFontSize))
        
        displayIsland()
        displayHomeTitle()
        setupCollectionView()
        data = User.shared.ongoingChallenges
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        data = User.shared.ongoingChallenges
    }
  
    func displayHomeTitle(){
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeTitle)
        
        // AttributedString pra poder customizar o espaçamento entre linhas
        let attributedString = NSMutableAttributedString(string: "ILHA DO\nJuliano")
        attributedString.addAttribute(.kern, value: ilhaDoKerning, range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: ilhaDoFontSize, weight: .light), range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: userNameFontSize), range: NSRange(location: 7, length: attributedString.length - 7))
        homeTitle.attributedText = attributedString
        
        homeTitle.numberOfLines = 0
        homeTitle.textAlignment = .center
        
        let centerXAnchor = homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerXAnchor.identifier = "labelCenterX"
        centerXAnchor.isActive = true

        let centerYAnchor = homeTitle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: distanceToTop)
        centerYAnchor.identifier = "labelCenterY"
        centerYAnchor.isActive = true
        homeTitle.widthAnchor.constraint(equalToConstant: titleLabelSize).isActive = true
        
//        homeTitle.layer.borderWidth = 1
        homeTitle.textColor = UIColor(named: "black")
    }
    
    
    func displayIsland() {
        island = IslandView()
        
        // Constraints
        island.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(island)
        let centerYAnchor = island.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yDistanceToCenter)
        centerYAnchor.identifier = "IslandCenterY"
        centerYAnchor.isActive = true
        
        let centerXAnchor = island.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerXAnchor.identifier = "IslandCenterX"
        centerXAnchor.isActive = true
        
        let heightAnchor = island.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: maxHeightProportion)
        heightAnchor.identifier = "IslandHeight"
        heightAnchor.isActive = true
        island.widthAnchor.constraint(equalTo: island.heightAnchor, multiplier: aspectRatio).isActive = true
        
//        island.layer.borderWidth = 1
    }
    
    func setupCollectionView() {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInset = UIEdgeInsets(top: 30, left: view.frame.width * borderSpacingProportion, bottom: 0, right: view.frame.width * borderSpacingProportion)
        layout.minimumInteritemSpacing = view.frame.width * interitemSpacingProportion
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        
        // Cells
        collectionView.register(ChallengeCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(NewTaskButton.self, forCellWithReuseIdentifier: "cell_new")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")

        // Delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Appearece
        collectionView.backgroundColor = UIColor(named: "bege")
        collectionView.showsVerticalScrollIndicator = false
        
        // Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        collectionView.topAnchor.constraint(equalTo: island.bottomAnchor, constant: topDistanceToIsland).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionViewYOrigin = collectionView.frame.origin.y
    }
    
    //MARK: Constants
    //MARK: Island Constants
    let maxHeightProportion: CGFloat = 0.33
    let minHeightProportion: CGFloat = 0.10
    let aspectRatio: CGFloat = 760/600
    let yDistanceToCenter: CGFloat = -150
    
    //MARK: CollectionView Constants
    let interitemSpacingProportion: CGFloat = 0.0375
    let borderSpacingProportion: CGFloat = 0.0375
    let topDistanceToIsland: CGFloat = 30
    
    //MARK: Title
    let userNameFontSize: CGFloat = 40
    let ilhaDoFontSize: CGFloat = 20
    let ilhaDoKerning: CGFloat = 2.6
    let distanceToTop: CGFloat = 90
    let centerDistanceToIsland: CGFloat = -65

}

extension HomeViewController: OpenCardViewControllerDelegate {
    func didUpdateChallenges() {
        data = User.shared.ongoingChallenges
    }
}
