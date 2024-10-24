//
//  FavoriteView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 18.09.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favoriteManager: FavoriteManager
    let movieNamespace: Namespace.ID
    
    var body: some View {
        NavigationStack {
            if favoriteManager.favoriteMovies.isEmpty {
                SearchSmthView(imageName: "notSelected", message: "No favourite movies, add some to your favourites ☺️")
                    .navigationTitle("💖 Your Favorites 💖")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                List {
                    ForEach(favoriteManager.favoriteMovies) { movie in
                        MovieCardView(movie: movie, movieNamespace: movieNamespace)
                    }
                    .onDelete(perform: removeMovies)
                }
                .navigationTitle("💖 Your Favorites 💖")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private func removeMovies(at offsets: IndexSet) {
        offsets.forEach { index in
            let movie = favoriteManager.favoriteMovies[index]
            favoriteManager.removeFavorite(movie: movie)
        }
    }
}

#Preview {
    @Previewable @Namespace var movieNamespace 
    
    return FavoriteView(movieNamespace: movieNamespace)
        .preferredColorScheme(.dark)
}
