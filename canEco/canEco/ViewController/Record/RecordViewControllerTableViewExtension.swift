//
//  RecordViewControllerTableViewExtension.swift
//  canEco
//
//  Created by Marco Zulian on 12/09/21.
//

import UIKit

extension RecordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return challengeData.count
        } else {
            return achievementData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageTitleSubtitleTableViewCell

        if segmentedControl.selectedSegmentIndex == 0 {
            let challenge = challengeData[indexPath.row]
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "d/M/Y"
            cell.configureCellInfo(withImage: UIImage(named: challenge.imageName)!, title: challenge.name, andSubtitle: formatter1.string(from: challenge.completionDate!))
            return cell
        } else {
            let achievement = achievementData[indexPath.row]
            cell.configureCellInfo(withImage: UIImage(named: "placeholder")!, title: achievement.0.name, andSubtitle: achievement.0.descricao)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(85, UITableView.automaticDimension)
    }
    
}
