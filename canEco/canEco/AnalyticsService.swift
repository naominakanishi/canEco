//
//  AnalyticsService.swift
//  canEco
//
//  Created by Marco Zulian on 15/12/21.
//

import Foundation
import Firebase
import FirebaseAnalytics

class AnalyticsService {
    func setView(name: Any) -> Void {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(name)",
                                       AnalyticsParameterScreenClass: "\(name)"])
    }
}
