//
//  Card.swift
//  Flashzilla
//
//  Created by Larry Nguyen on 9/28/20.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "What is 2+2?", answer: "4")
    }
}
