//
//  SearchResult.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/21/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    
    
    let resultCount: Int
    let results: [Result]
    
}

struct Result: Codable {
    
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
    
}
