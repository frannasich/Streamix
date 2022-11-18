//
//  Review.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import Foundation

struct ReviewResponse: Codable {
    let results: [Review]
}

struct Review: Codable {
    let id: Int?
    let author: String?
    let content: String?
}
