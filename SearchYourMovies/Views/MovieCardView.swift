//
//  MovieCardView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 19.09.2024.
//

import SwiftUI

struct MovieCardView: View {
    var movie: MovieDetails
    @EnvironmentObject var favoriteManager: FavoriteManager
    let movieNamespace: Namespace.ID
    
    let posterBaseURL = "https://image.tmdb.org/t/p/w500"
    
    var body: some View {
        
        HStack(spacing: 0) {
            NavigationLink(destination: SearchDetailView(movie: movie, movieNamespace: movieNamespace)) {
                
                HStack {
                    if let posterPath = movie.posterPath {
                        AsyncImage(url: URL(string: "\(posterBaseURL)\(posterPath)")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 145)
                                .cornerRadius(8)
                                .clipped()
                        } placeholder: {
                            Image("noImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 145)
                                .cornerRadius(8)
                                .clipped()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(movie.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .minimumScaleFactor(0.8)
                        
                        HStack {
                            Image(systemName: "clock.fill")
                            Text(movie.runtime != nil && movie.runtime! > 0 ? "\(movie.runtime!) h" : "N/A")
                        }
                        .font(.headline)
                        .foregroundColor(.myColor)
                        
                        HStack {
                            Image(systemName: "calendar.circle")
                            Text(DateUtils.formatReleaseYear(movie.releaseDate))
                        }
                        .font(.headline)
                        .foregroundColor(.myColor)
                        
                        HStack {
                            Image(systemName: "star.circle")
                            Text("\(movie.voteAverage, specifier: "%.1f")")
                        }
                        .font(.headline)
                        .foregroundColor(.myColor)
                    }
                    .padding(.leading, 10)
                }
                .contentShape(Rectangle())
            }
            
            Spacer()
            
            Button {
                favoriteManager.toggleFavorite(movie: movie)
            } label: {
                Image(systemName: favoriteManager.isFavorite(movie: movie) ? "heart.fill" : "heart")
                    .padding(.trailing, 20)
                    .font(.title)
            }
            .foregroundColor(.myColor)
            .buttonStyle(PlainButtonStyle())
        }
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.myColor, lineWidth: 2)
        )
    }
}

#Preview {
    @Previewable @Namespace var movieNamespace
    
    return MovieCardView(movie: MovieDetails(
        id: 123,
        title: "Sample Movie",
        releaseDate: "2023",
        runtime: 120,
        voteAverage: 8.5,
        posterPath: "testImage",
        overview: "This is a sample overview for a movie. It's a brief description of the movie's plot and key elements.",
        productionCompanies: [ProductionCompany(id: 1, name: "Sample Production Company")],
        popularity: 89.0
    ), movieNamespace: movieNamespace) 
        .preferredColorScheme(.dark)
}
