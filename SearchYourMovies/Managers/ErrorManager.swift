//
//  ErrorManager.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 20.09.2024.
//

import Foundation

enum ErrorManager: Error {
    case invalidData
    case invalidURL
    case invalidResponse
    case unableToComplete
}
