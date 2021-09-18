//
//  InfoViewController.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class InfoViewController: UIViewController {

    let info = UIScrollView()
    var introLabel = UILabel()
    var fashionLabel = CategoryInfo()
    var foodLabel = CategoryInfo()
    var shoppingLabel = CategoryInfo()
    var transportationLabel = CategoryInfo()
    var wasteLabel = CategoryInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Seus impactos"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(returnToMain))
        view.backgroundColor = UIColor(named: "bege")
        
        setupInfo()
        setupIntro()
        setupFashionLabel()
        setupFoodLabel()
        setupShoppingLabel()
        setupTransportationLabel()
        setupWasteLabel()
    }
    
    @objc func returnToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupInfo() {
        info.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(info)
        
        info.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        info.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        info.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        info.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupIntro() {
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(introLabel)
        
        NSLayoutConstraint.activate([
            introLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            introLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor),
            introLabel.topAnchor.constraint(equalTo: info.topAnchor, constant: 30),
            introLabel.widthAnchor.constraint(equalTo: info.widthAnchor, multiplier: 1)
        ])
        
        introLabel.text = "Cada vez que você inicia e concluí um desafio, suas atitudes geram impactos. Esses impactos são divididos em XX áreas."
        introLabel.font = UIFont(name: "Ubuntu-Light", size: 16)
        introLabel.numberOfLines = 0
        introLabel.textAlignment = .justified
    }
    
    func setupFashionLabel() {
        fashionLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(fashionLabel)
        
        NSLayoutConstraint.activate([
            fashionLabel.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 40),
            fashionLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            fashionLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor),
        ])
        
        fashionLabel.category = .fashion
    }
    
    func setupFoodLabel() {
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(foodLabel)
        
        NSLayoutConstraint.activate([
            foodLabel.topAnchor.constraint(equalTo: fashionLabel.bottomAnchor, constant: 70),
            foodLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            foodLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor)
        ])
        
        foodLabel.category = .food
    }
    
    func setupShoppingLabel() {
        shoppingLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(shoppingLabel)
        
        NSLayoutConstraint.activate([
            shoppingLabel.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 70),
            shoppingLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            shoppingLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor)
        ])
        
        shoppingLabel.category = .shopping
    }
    
    func setupTransportationLabel() {
        transportationLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(transportationLabel)
        
        NSLayoutConstraint.activate([
            transportationLabel.topAnchor.constraint(equalTo: shoppingLabel.bottomAnchor, constant: 70),
            transportationLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            transportationLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor)
        ])
        
        transportationLabel.category = .transportation
    }
    
    func setupWasteLabel() {
        wasteLabel.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(wasteLabel)
        
        NSLayoutConstraint.activate([
            wasteLabel.topAnchor.constraint(equalTo: transportationLabel.bottomAnchor, constant: 70),
            wasteLabel.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            wasteLabel.trailingAnchor.constraint(equalTo: info.trailingAnchor),
            wasteLabel.bottomAnchor.constraint(equalTo: info.bottomAnchor)
        ])
        
        wasteLabel.category = .waste
    }
}

//extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = info.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryInfo
//        cell.category = categories[indexPath.row]
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return max(395, UITableView.automaticDimension)
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 395
//    }
//    
//    
//}
