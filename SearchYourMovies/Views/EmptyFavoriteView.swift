//
//  EmptyFavoriteView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 24.09.2024.
//

import SwiftUI

struct EmptyFavoriteView: View {
    
    let imageForEmptyState: String
    let messageForEmptyState: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageForEmptyState)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text(messageForEmptyState)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.myColor)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyFavoriteView(imageForEmptyState: "notSelected", messageForEmptyState: "No favourite movies, add some to your favourites ☺️")
}
