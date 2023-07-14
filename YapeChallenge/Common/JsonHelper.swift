//
//  JsonHelper.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation

class JsonHelper {
    
    static func getDataFromJsonFile<T: Decodable>(model: T.Type, jsonName: String) -> T? {
        
        if let filePath = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: filePath)
                let jsonData = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                
                return decodedData
                
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                return nil
            }
        } else {
            print("JSON file not found")
            return nil
        }
    }
    
}
