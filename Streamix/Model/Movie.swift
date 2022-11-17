//
//  Movie.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let originalLanguage: String?
    let popularity: Double?
    let backdropPath: String?
    let posterPath: String?
    let voteCoverage: Double?
    let voteCount: Int?
    let video: Bool?
    let adult: Bool?
    let releaseData: String?
    var posterPathURL: String {
        if let path = posterPath {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return ""
        }
    }
    var voteCoverageRounded: Double {
        if let vc = voteCoverage {
            return vc / 10.0
        }
        return 0.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = originalLanguage else {return ""}
        return "\(title)(\(lang)"
    }
}
