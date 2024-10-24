//
//  MovieModel.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 19.09.2024.
//

import Foundation

struct ProductionCompany: Codable, Identifiable {
    let id: Int
    let name: String
}

struct MovieDetails: Codable, Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let runtime: Int?
    let voteAverage: Double
    let posterPath: String?
    let overview: String?
    let productionCompanies: [ProductionCompany]?
    let popularity: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case runtime
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case overview
        case productionCompanies = "production_companies"
        case popularity
    }
}

struct MovieResponse: Codable {
    let results: [MovieDetails]
}

