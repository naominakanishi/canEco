//
//  InfoViewController.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class InfoViewController: UIViewController {

    let info = UITableView()
    let categories: [Category] = [.fashion, .food, .shopping, .transportation, .waste]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Seus impactos"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(returnToMain))
        view.backgroundColor = UIColor(named: "bege")
        
        setupInfo()
    }
    
    @objc func returnToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupInfo() {
        info.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(info)
        
        info.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        info.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        info.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        info.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        info.register(CategoryInfo.self, forCellReuseIdentifier: "Cell")

        info.delegate = self
        info.dataSource = self
        info.allowsSelection = false
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = info.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryInfo
        cell.category = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(395, UITableView.automaticDimension)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 395
    }
    
    
}
