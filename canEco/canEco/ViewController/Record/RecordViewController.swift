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
    var challengeData: [CompletedChallenge]!

    override func viewWillAppear(_ animated: Bool) {
        hidesBottomBarWhenPushed = true
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
        achievementData = Achievements.achievements
        challengeData = [CompletedChallenge(
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
        )]
    }
    
    func setupSegmentedControl() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        segmentedControl.insertSegment(withTitle: "Títulos", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Desafios", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectedIndexChanged), for: .valueChanged)
    }
    
    @objc func selectedIndexChanged(_ sender: UISegmentedControl) {
        dataTableView.reloadData()
    }

    func setupDataTableView() {
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dataTableView)
        
        dataTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dataTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dataTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dataTableView.register(ImageTitleSubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
        dataTableView.allowsSelection = false
        dataTableView.delegate = self
        dataTableView.dataSource = self
        dataTableView.backgroundColor = UIColor(named: "bege")
    }
}
