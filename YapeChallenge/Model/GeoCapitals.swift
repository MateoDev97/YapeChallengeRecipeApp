//
//  Capitals.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation

struct GeoCapitals: Codable {
    let type: String
    let features: [Feature]
}

struct Feature: Codable {
    let properties: Properties
    let geometry: Geometry
    let id: String
}

struct Geometry: Codable {
    let coordinates: [Double]
    let type: String
}

struct Properties: Codable {
    let country: String
    let city: String?
    let tld, iso3, iso2: String
}
