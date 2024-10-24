//
//  MovieViewModel.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 20.09.2024.
//

import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    @Published var searchQuery: String = "" 
    @Published var movies: [MovieDetails] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?

    private let networking = MovieAPI()

    func searchMovies(query: String) async {
        isLoading = true
        do {
            let result = try await networking.searchMovies(query: query)
            DispatchQueue.main.async {
                self.movies = result
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}


