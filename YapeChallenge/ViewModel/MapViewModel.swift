//
//  MapViewModel.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation


class MapViewModel: ObservableObject {
    
    private var listPoints: [Feature] = []
    
    @Published var randomFeature: Feature?
    
    func setUpViewModel() {
        if let geoCapitalsData = JsonHelper.getDataFromJsonFile(model: GeoCapitals.self, jsonName: "capitals") {
            
            listPoints = geoCapitalsData.features
            
            
            getRandomFeature()
        }
    }
    
    
    func getRandomFeature() {
        
        randomFeature = listPoints.randomElement()
        
        dump(randomFeature)
    }
}
