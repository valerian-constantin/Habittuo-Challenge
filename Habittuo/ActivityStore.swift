//
//  ActivityStore.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import Foundation
import Observation

@Observable
class ActivityStore {
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        activities = []
    }
    
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
}
