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
    
    var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let tabBar = UITabBarItem(title: "Novo Desafio", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)))
        tabBarItem = tabBar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupFilter()
    }
    
    func setupFilter() {
        
        collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.estimatedItemSize = CGSize(width: 100, height: 40)
        
        filter = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: collectionLayout)
        filter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filter)
        filter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.07).isActive = true
//        filter.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        filter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width * 0.07).isActive = true
        filter.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        filter.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.04).isActive = true
        
        filter.register(CategoryTagCollectionViewCell.self, forCellWithReuseIdentifier: "filterTag")
        filter.backgroundColor = .white
        filter.dataSource = self
        filter.delegate = self
        
    }

}

extension NewChallengeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterTag", for: indexPath) as! CategoryTagCollectionViewCell
        cell.category = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryTagCollectionViewCell
        cell.ativo.toggle()
    }
}
