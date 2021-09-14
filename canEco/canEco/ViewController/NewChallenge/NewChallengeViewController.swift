//
//  NewChallengeViewController.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class NewChallengeViewController: UIViewController {

    var filter: UICollectionView!
    var data: [Category?] = [nil, Category.fashion, Category.food, Category.shopping, Category.transportation, Category.waste]
    var data2: [Challenge]!
    var challengesCollectionView: UICollectionView!
    
    var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let tabBar = UITabBarItem(title: "Novo Desafio", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))
        tabBarItem = tabBar
        
        data2 = Challenges.getChallenges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bege")
//        navigationController?.setNavigationBarHidden(true, animated: false)
        title = "Desafios"
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        setupFilter()
        displayChallengesCv()
//        benefit = NewChallengeCardCollectionViewCell()
//        benefit.challenge = RepeatableChallenge(name: "placeholder", category: .fashion, benefits: [.co2, .diseases, .energy], totalSteps: 10)
//        benefit.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(benefit)
//        benefit.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        benefit.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
//        benefit.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
//        benefit.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.6).isActive = true
    }
    
    @objc func searchTapped() {
        
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
//        filter.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        filter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        filter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        filter.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.04).isActive = true
        
        filter.register(CategoryTagCollectionViewCell.self, forCellWithReuseIdentifier: "filterTag")
        filter.backgroundColor = UIColor(named: "bege")
        filter.showsHorizontalScrollIndicator = false
        filter.dataSource = self
        filter.delegate = self
        
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

extension NewChallengeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return data2.count
        }
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "challengeCard", for: indexPath) as! CardCollectionViewCell
            cell.challenge = data2[indexPath.item]
            cell.navigateToOpenCard = navigateToOpenCard
            cell.delegate = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterTag", for: indexPath) as! CategoryTagCollectionViewCell
        cell.category = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            return CGSize(width: 311, height: 475)
        }
        
        let height = filter.frame.height
        let width: CGFloat!
        
        if data[indexPath.item] != nil {
            width = data[indexPath.item]!.rawValue.width(withConstrainedHeight: height, font: UIFont.systemFont(ofSize: 16, weight: .regular))
        } else {
            width = "TODOS".width(withConstrainedHeight: height, font: UIFont.systemFont(ofSize: 16, weight: .regular))
        }
        return CGSize(width: width + 30, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == challengesCollectionView {
            let challenge = data2[indexPath.item]
            navigateToOpenCard(challenge: challenge)
            return
        }
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryTagCollectionViewCell
        
        if cell.displayMode == .fill {
            cell.displayMode = .unfill
        } else {
            cell.displayMode = .fill
        }
    }
    
    private func navigateToOpenCard(challenge: Challenge) {
        let controller = OpenCardViewController(challenge: challenge)
        navigationController?.present(controller, animated: true)
    }
}
