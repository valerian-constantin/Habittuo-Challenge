//
//  Activity.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import Foundation

struct Activity: Identifiable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var CompletionCount: Int
    var description: String
    
}
