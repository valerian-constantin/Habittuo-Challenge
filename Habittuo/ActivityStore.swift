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
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
}
