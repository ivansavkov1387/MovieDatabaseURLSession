//
//  Model.swift
//  MovieDatabaseURLSession
//
//  Created by Иван on 9/9/21.
//

import Foundation

struct MoviesData: Decodable {
    let results: [Movie]
}
struct Movie: Decodable {
    let title: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Float?
    let backdrop_path: String?
}

