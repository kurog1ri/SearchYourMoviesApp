//
//  FavoriteManager .swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 01.10.2024.
//

import Foundation
import SwiftUI

class FavoriteManager: ObservableObject {
    @Published var favoriteMovies: [MovieDetails] = []
    
    func toggleFavorite(movie: MovieDetails) {
        if favoriteMovies.contains(where: { $0.id == movie.id }) {
            removeFavorite(movie: movie)
        } else {
            addFavorite(movie: movie)
        }
    }
    
    func addFavorite(movie: MovieDetails) {
        favoriteMovies.append(movie)
    }
    
    func removeFavorite(movie: MovieDetails) {
        favoriteMovies.removeAll { $0.id == movie.id }
    }
    
    func isFavorite(movie: MovieDetails) -> Bool {
        favoriteMovies.contains(where: { $0.id == movie.id })
    }
}
