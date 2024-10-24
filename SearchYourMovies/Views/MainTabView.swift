//
//  ContentView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 18.09.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var favoriteManager: FavoriteManager
    @Namespace var movieNamespace
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {Label("Search", systemImage: "magnifyingglass.circle.fill")}
            
            FavoriteView(movieNamespace: movieNamespace)
                .tabItem {Label("Favorite", systemImage: "heart.circle.fill")}
                .badge(favoriteManager.favoriteMovies.count)
        }
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.dark)
}
