//
//  Moonshot.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 1.02.2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let description: String
    
    let launchDate: Date?
    let crew: [CrewRole]
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
