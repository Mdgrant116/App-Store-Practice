//
//  AppGroup.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation

struct AppGroup: Codable {
    
    let feed: Feed
    
}

struct Feed: Codable {
    
    let title: String
    let results: [FeedResult]
    
}

struct FeedResult: Codable {
    
    let artistName: String
    let name: String
    let artworkUrl100: String
    
}
