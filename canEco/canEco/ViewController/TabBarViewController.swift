//
//  TabBarViewController.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comandos para arredondar as bordas da TabBar
        
        viewControllers = [
            HomeViewController(),
            UINavigationController(rootViewController: NewChallengeViewController()),
            ProfileViewController()
        ]
    
       
        selectedIndex = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.backgroundColor = .blue
        
        backgroundView.layer.borderWidth = 0.1
        backgroundView.layer.cornerRadius = 35
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.tintColor = UIColor(named: "accentGreen")
        backgroundView.backgroundColor = UIColor(named: "beige")
        
        tabBar.unselectedItemTintColor = UIColor(named: "gray")
        tabBar.tintColor = UIColor(named: "accentGreen")
        tabBar.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "black") ?? .black]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "black") ?? .black]
        
        tabBar.sendSubviewToBack(backgroundView)
    }
}

