//
//  NewChallengeViewController.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class NewChallengeViewController: UIViewController {

    var filter: UICollectionView!
    var data2: [Challenge]!
    var selectedCategories: [Category] = []
    var challengesCollectionView: UICollectionView!
    
    var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    let filterDelegate = FilterCollectionViewManager()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let tabBar = UITabBarItem(title: "Novo Desafio", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))
        tabBarItem = tabBar
        filterDelegate.associetedVC = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bege")
        title = "Desafios"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        setupFilter()
        displayChallengesCv()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filterData()
        challengesCollectionView.reloadData()
    }
    
    func filterData() {
        let allChallenges = Challenges.getChallenges()
        data2 = allChallenges
        if !selectedCategories.isEmpty {
            let filteredChallenges = allChallenges.filter { selectedCategories.contains($0.category)
            }
            data2 = filteredChallenges
        }
        challengesCollectionView.reloadData()
    }
    
    @objc func searchTapped() {
        
    }
    
    func select(category: Category) {
        selectedCategories.append(category)
    }

    func deselect(category: Category) {
        selectedCategories.removeAll(where: { $0 == category})
    }
    
    func setupFilter() {
        
        collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.estimatedItemSize = CGSize(width: 100, height: 40)
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: view.frame.width * 0.07, bottom: 0, right: view.frame.width * 0.07)
        
        filter = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: collectionLayout)
        filter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filter)
        filter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        filter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        filter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        filter.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.04).isActive = true
        
        filter.register(CategoryTagCollectionViewCell.self, forCellWithReuseIdentifier: "filterTag")
        filter.backgroundColor = UIColor(named: "bege")
        filter.showsHorizontalScrollIndicator = false
        filter.dataSource = filterDelegate
        filter.delegate = filterDelegate
        
    }
    
    func displayChallengesCv() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: view.frame.width * 0.5 - 311 / 2, bottom: 0, right: view.frame.width * 0.07)
        layout.minimumLineSpacing = 25
        
        challengesCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        
        challengesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(challengesCollectionView)
        challengesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        challengesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        challengesCollectionView.topAnchor.constraint(equalTo: filter.bottomAnchor, constant: 30).isActive = true
        challengesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        challengesCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "challengeCard")
        challengesCollectionView.dataSource = self
        challengesCollectionView.delegate = self
        challengesCollectionView.backgroundColor = UIColor(named: "bege")
        challengesCollectionView.isPagingEnabled = false
        challengesCollectionView.showsHorizontalScrollIndicator = false
        challengesCollectionView.tag = 1
    }

}
