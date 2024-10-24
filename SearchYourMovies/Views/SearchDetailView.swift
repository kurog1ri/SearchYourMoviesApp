//
//  SearchDetailView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 30.09.2024.
//

import SwiftUI

struct SearchDetailView: View {
    
    let movie: MovieDetails
    var movieNamespace: Namespace.ID
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                if let posterPath = movie.posterPath {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .shadow(radius: 8)
                            .matchedGeometryEffect(id: movie.id, in: movieNamespace)
                    } placeholder: {
                        Image("noImage")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .shadow(radius: 8)
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.myColor)
                    
                    Text("Release date: \(DateUtils.formatReleaseYear(movie.releaseDate)) 🎯")
                        .font(.title3)
                        .foregroundColor(.myColor)
                    
                    if let runtime = movie.runtime, runtime > 0 {
                        Text("Runtime: \(runtime) min 🕓")
                            .font(.title3)
                            .foregroundColor(.myColor)
                    } else {
                        Text("Runtime: N/A 🕓")
                            .font(.title3)
                            .foregroundColor(.myColor)
                    }
                    
                    Text("Rating: \(movie.voteAverage, specifier: "%.1f")/10 ⭐️")
                        .font(.title3)
                        .foregroundColor(.yellow)
                    
                    if let popularity = movie.popularity {
                        Text("Popularity: \(Int(popularity)) 🔥")
                            .font(.title3)
                            .foregroundColor(.orange)
                    }
                    
                    if let productionCompanies = movie.productionCompanies, !productionCompanies.isEmpty {
                        Text("Production Companies: \(productionCompanies.map { $0.name }.joined(separator: ", ")) 🎥")
                            .font(.title3)
                            .foregroundColor(.indigo)
                    } else {
                        Text("Production Companies: N/A 🎥")
                            .font(.title3)
                            .foregroundColor(.indigo)
                    }
                    
                    if let overview = movie.overview {
                        Text("🧐 Overview 🧐:")
                            .font(.headline)
                            .padding(.top, 8)
                            .padding(.leading, 90)
                            .foregroundColor(.myColor)
                        
                        Text(overview)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.myColor)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @Namespace var movieNamespace

    return SearchDetailView(
        movie: MovieDetails(
            id: 123,
            title: "Sample Movie",
            releaseDate: "2023",
            runtime: 120,
            voteAverage: 8.5,
            posterPath: "testImage",
            overview: "This is a sample overview for a movie. It's a brief description of the movie's plot and key elements.",
            productionCompanies: [ProductionCompany(id: 1, name: "Sample Production Company")],
            popularity: 89.0
        ),
        movieNamespace: movieNamespace
    )
}
