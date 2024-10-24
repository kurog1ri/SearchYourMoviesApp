//
//  Networking.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 20.09.2024.
//
import Foundation

class MovieAPI {
    
    let baseURL = "https://advanced-movie-search.p.rapidapi.com/"
    let apiKey = "763ae91cefmshd9eaadb9b04a0fap1a6384jsn995e6b9f9f67"
    
    private var headers: [String: String] {
        return [
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": "advanced-movie-search.p.rapidapi.com"
        ]
    }
    
    func searchMovies(query: String) async throws -> [MovieDetails] {
        let endpoint = "\(baseURL)search/movie?query=\(query)"
        guard let url = URL(string: endpoint) else {
            throw ErrorManager.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorManager.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return decodedResponse.results
        } catch {
            throw ErrorManager.invalidData
        }
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetails {
        let endpoint = "\(baseURL)movies/getdetails?movie_id=\(movieId)"
        guard let url = URL(string: endpoint) else {
            throw ErrorManager.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorManager.invalidResponse
        }
        
        do {
            let decodedMovie = try JSONDecoder().decode(MovieDetails.self, from: data)
            return decodedMovie
        } catch {
            throw ErrorManager.invalidData
        }
    }
}
