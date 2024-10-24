//
//  SearchYourMoviesApp.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 18.09.2024.
//

import SwiftUI

@main
struct YourApp: App {
    
    @StateObject var favoriteManager = FavoriteManager()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(favoriteManager)
        }
    }
}
