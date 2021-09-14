//
//  ProfileTableViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(2, data.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = completedChallenges.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageTitleSubtitleTableViewCell
        let challenge = data[indexPath.row]
        cell.configureCellInfo(withImage: UIImage(named: "placeholder")!, title: challenge.challenge.name, andSubtitle: challenge.completionDate.description(with: nil))
        
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
        header.headerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return header
    }
    
    @objc func buttonAction() {
        let navVc = UINavigationController(rootViewController: RecordViewController())
        navVc.modalPresentationStyle = .fullScreen
        
        present(navVc, animated: true)
        navigationController?.pushViewController(RecordViewController(), animated: true)
    }
    
}
