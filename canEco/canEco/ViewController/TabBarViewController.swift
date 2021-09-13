//
//  TabBarViewController.swift
//  canEco
//
//  Created by Marco Zulian on 04/09/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Comandos para arredondar as bordas da TabBar
        tabBar.layer.borderWidth = 0.1
        tabBar.layer.cornerRadius = 35
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        tabBar.isTranslucent = true
        tabBar.tintColor = UIColor(named: "yellow")
        viewControllers = [
            HomeViewController(),
            UINavigationController(rootViewController: NewChallengeViewController()),
            ViewController()
        ]
        
        viewControllers = [HomeViewController(),
                           NewChallengeViewController(),
                           ProfileViewController()]
        selectedIndex = 0
    }
}
