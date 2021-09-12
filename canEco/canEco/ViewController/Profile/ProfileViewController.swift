//
//  ProfileViewController.swift
//  canEco
//
//  Created by Marco Zulian on 11/09/21.
//

import UIKit

class ProfileViewController: UIViewController {

    let header = ProfileHeaderView()
    var impactCount: UICollectionView!
    let completedChallenges = UITableView()
    var data: [CompletedChallenge]! = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let tabBar = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        tabBarItem = tabBar
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        data = [CompletedChallenge(
                    challenge: RepeatableChallenge(
                        name: "Ir de bike para o trabalho",
                        category: .transportation,
                        benefits: [.co2, .diseases, .polution],
                        totalSteps: 4
                    )
                ),
                CompletedChallenge(
                    challenge: StepChallenge(
                        name: "Construir uma composteira",
                        category: .waste,
                        benefits: [.waste, .waste],
                        steps: [("Construir uma composteira", true)]
                    )
                )
        ]
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
        layout.sectionInset = UIEdgeInsets(top: layout.minimumInteritemSpacing, left: view.frame.width * 0.035, bottom: 0, right: view.frame.width * 0.035)
        layout.scrollDirection = .vertical
        
        impactCount = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: layout)
        impactCount.allowsSelection = false
        impactCount.isScrollEnabled = false
        
        impactCount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(impactCount)
        
        impactCount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        impactCount.topAnchor.constraint(equalTo: header.bottomAnchor, constant: view.bounds.height * 0.03).isActive = true
        impactCount.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        impactCount.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        impactCount.register(ImpactCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        impactCount.register(ImpactHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        impactCount.dataSource = self
        impactCount.delegate = self
        
        impactCount.backgroundColor = UIColor(named: "bege")
    }
    
    func setupCompletedChallenges() {
        completedChallenges.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(completedChallenges)
        
        completedChallenges.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        completedChallenges.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        completedChallenges.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        completedChallenges.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        completedChallenges.isScrollEnabled = false
        completedChallenges.allowsSelection = false
        
        completedChallenges.register(CompletedChallengeTableViewCell.self, forCellReuseIdentifier: "Cell")
        completedChallenges.register(CompletedChallengeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
        completedChallenges.dataSource = self
        completedChallenges.delegate = self
        completedChallenges.backgroundColor = UIColor(named: "bege")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = completedChallenges.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CompletedChallengeTableViewCell
        cell.challenge = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(85, UITableView.automaticDimension)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return max(48, UITableView.automaticDimension)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = completedChallenges.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! CompletedChallengeTableViewHeader
        return header
    }
    
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = impactCount.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImpactCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = impactCount.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! ImpactHeaderCollectionReusableView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 3
        let widthMultiplier: CGFloat = 1
        
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let insets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth = collectionViewWidth - spaceBetweenCells - insets
        let width: CGFloat = floor(adjustedWidth / columns)
        let height: CGFloat = width * widthMultiplier
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print(collectionView.frame.width)
        return CGSize(width: collectionView.frame.width, height: 48)
    }
    
}
