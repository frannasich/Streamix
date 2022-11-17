//
//  Cast.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import Foundation

struct CastResponse: Codable {
    let cast: [Cast]
}

struct Cast: Codable {
    let id: String?
    let name: String?
    let character: String?
    let profilePath: String?
    var profilePhoto: String {
        if let path = profilePath {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return "https://picsum.photos/200/300"
    }
}
