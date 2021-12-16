//
//  RecordViewController.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

class RecordViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl()
    let dataTableView = UITableView()
    
    var achievementData: [(Achievement, Bool)]!
    var challengeData: [Challenge]!

    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        hidesBottomBarWhenPushed = true
        AnalyticsService().setView(name: RecordViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        setupSegmentedControl()
        setupDataTableView()
        view.backgroundColor = UIColor(named: "bege")
        navigationController?.isNavigationBarHidden = false
        hidesBottomBarWhenPushed = true
        title = "Histórico"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(returnToMain))
        
    }
    
    @objc func returnToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchData() {
        
        achievementData = Achievements.achievements.filter { $0.1 }
        challengeData = User.shared.record.challengeRecord.reversed()
        
    }
    
    func setupSegmentedControl() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        segmentedControl.insertSegment(withTitle: "Desafios", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Títulos", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectedIndexChanged), for: .valueChanged)
    }
    
    @objc func selectedIndexChanged(_ sender: UISegmentedControl) {
        dataTableView.reloadData()
        if sender.selectedSegmentIndex == 1 {
            dataTableView.allowsSelection = true
        } else {
            dataTableView.allowsSelection = false
        }
    }

    func setupDataTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dataTableView)
        
        dataTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dataTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dataTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dataTableView.register(ImageTitleSubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
        dataTableView.register(EmojiTitleSubtitleTableViewCell.self, forCellReuseIdentifier: "AchievementCell")
        dataTableView.allowsSelection = false
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.backgroundColor = UIColor(named: "bege")
    }
}
