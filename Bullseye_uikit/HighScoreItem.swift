//
//  HighScoreItem.swift
//  Bullseye_uikit
//
//  Created by aybjax on 5/30/21.
//

import Foundation

class HighScoreItem: NSObject, Codable {    
    var name: String
    var score = 0
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
