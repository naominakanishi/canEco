//
//  ProfileViewController.swift
//  canEco
//
//  Created by Marco Zulian on 11/09/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    let header = ProfileHeaderView()
    var impactCount: UICollectionView!
    var completedChallenges: UITableView!
    var data: [Challenge]! = []
    var benefitCountData: [BenefitRecord]!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let tabBar = UITabBarItem(title: "Meu Progresso", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        tabBarItem = tabBar
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        header.setupAchievementLabel()
        setupImpactCount()
        setupCompletedChallenges()
        AnalyticsService().setView(name: ProfileViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        setupHeaderView()
        setupImpactCount()
        setupCompletedChallenges()
        view.backgroundColor = UIColor(named: "bege")
    }
    
    func fetchData() {
        benefitCountData = User.shared.record.benefitRecord
        data = User.shared.record.challengeRecord.reversed()
    }
    
    func setupHeaderView() {
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func setupImpactCount() {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumInteritemSpacing = view.frame.width * 0.05
        layout.minimumLineSpacing = layout.minimumInteritemSpacing * 0.7
        layout.sectionInset = UIEdgeInsets(top: 0, left: view.frame.width * 0.035, bottom: 0, right: view.frame.width * 0.035)
        layout.scrollDirection = .vertical
        
        impactCount = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        impactCount.allowsSelection = false
        impactCount.isScrollEnabled = false
        
        impactCount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(impactCount)
        
        impactCount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        impactCount.topAnchor.constraint(equalTo: header.bottomAnchor, constant: view.bounds.height * 0.03).isActive = true
        impactCount.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.42).isActive = true
        impactCount.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        impactCount.register(ImpactCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        impactCount.register(ImpactHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        impactCount.dataSource = self
        impactCount.delegate = self
        
        impactCount.backgroundColor = UIColor(named: "bege")
    }
    
    func setupCompletedChallenges() {
        completedChallenges = UITableView()
        completedChallenges.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(completedChallenges)
        
        completedChallenges.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        completedChallenges.topAnchor.constraint(equalTo: impactCount.bottomAnchor).isActive = true
        completedChallenges.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        completedChallenges.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        completedChallenges.isScrollEnabled = false
        completedChallenges.allowsSelection = false
        
        completedChallenges.register(ImageTitleSubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
        completedChallenges.register(CompletedChallengeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
        completedChallenges.dataSource = self
        completedChallenges.delegate = self
        completedChallenges.backgroundColor = UIColor(named: "bege")
    }
}
