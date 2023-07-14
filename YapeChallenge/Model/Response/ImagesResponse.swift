//
//  ImagesResponse.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation

struct ImagesResponse: Codable {
    let meta: Meta
    let imageResults: [ImageResult]

    enum CodingKeys: String, CodingKey {
        case meta
        case imageResults = "image_results"
    }
}

struct ImageResult: Codable {
    let title: String
    let thumbnail: String
    let original: String
    let rank: Int
}

struct Meta: Codable {
    let apiKey, q, gl: String

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case q, gl
    }
}
