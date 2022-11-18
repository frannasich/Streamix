//
//  MovieURL.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import Foundation

enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    
    public var urlString: String {
        "baseURL\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}
