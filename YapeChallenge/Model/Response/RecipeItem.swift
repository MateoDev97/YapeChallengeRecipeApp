//
//  RecipeItem.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation

struct RecipeItem: Codable, Identifiable {
    var id = UUID()
    let title, ingredients, servings, instructions: String
    
    var numberServings: Int {
        let numberString: String = servings.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return Int(numberString) ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case title, ingredients, servings, instructions
    }
}
