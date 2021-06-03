//
//  Meditation.swift
//  Moment
//
//  Created by Christopher Cowdrey on 5/20/21.
//

import Foundation

class Meditation {
    var title: String
    var description: String
    var type: Category
    var instructions: String
    
    enum Category: String {
        case mantra
        case breathing
        case nirvana
    }
    
    init(title: String, type: Category, instructions: String, description: String) {
        self.title = title
        self.type = type
        self.instructions = instructions
        self.description = description
    }
    
    convenience init() {
        self.init(title: "String", type: .breathing, instructions: "String", description: "String")
    }
}
