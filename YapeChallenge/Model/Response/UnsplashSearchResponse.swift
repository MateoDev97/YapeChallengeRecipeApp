//
//  UnsplashSearchResponse.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2026-01-15.
//

import Foundation

struct UnsplashSearchResponse: Codable {
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Codable {
    let id: String
    let urls: UnsplashPhotoURLs
    let description: String?
}

struct UnsplashPhotoURLs: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
