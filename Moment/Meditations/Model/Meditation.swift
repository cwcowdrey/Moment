//
//  Meditation.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation

class Meditation {
    var title: String
    var category: Category
    var instructions: String
    
    var time: String
    var position: String
    var materials: String
    
    var type: MeditationType
    
    
    enum Category: String {
        case mantra = "Mantra"
        case breathing = "Breathing"
        case body = "Body"
    }
    
    init(title: String, category: Category, instructions: String, time: String, position: String, materials: String, type: MeditationType) {
        self.title = title
        self.category = category
        self.instructions = instructions
        self.time = time
        self.position = position
        self.materials = materials
        self.type = type
    }
    
    convenience init() {
        self.init(title: "title", category: .breathing, instructions: "instructions", time: "time", position: "position", materials: "materials", type: .chakras)
    }
}

enum MeditationType: String {
    case box
    case kundalini
    case four78
    case shamatha
    case soham
    case together
    case bodyscan
    case chakras
    case belazy
}
