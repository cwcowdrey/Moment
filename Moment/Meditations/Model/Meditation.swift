//
//  Meditation.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation

class Meditation {
    var title: String
    var type: Category
    var instructions: String
    
    var time: String
    var position: String
    var materials: String
    
    enum Category: String {
        case mantra = "Mantra"
        case breathing = "Breathing"
        case body = "Body"
    }
    
    init(title: String, type: Category, instructions: String, time: String, position: String, materials: String) {
        self.title = title
        self.type = type
        self.instructions = instructions
        self.time = time
        self.position = position
        self.materials = materials
    }
    
    convenience init() {
        self.init(title: "title", type: .breathing, instructions: "instructions", time: "time", position: "position", materials: "materials")
    }
}
