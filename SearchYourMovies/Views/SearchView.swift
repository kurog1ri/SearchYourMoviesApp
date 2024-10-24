//
//  SearchView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 18.09.2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var vm = MovieViewModel()
    @Namespace private var movieNamespace
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    ProgressView("Loading...")
                        .foregroundColor(.myColor)
                        .progressViewStyle(CircularProgressViewStyle(tint: .myColor))
                        .scaleEffect(1.7)
                } else if vm.movies.isEmpty && !vm.searchQuery.isEmpty {
                    Text("No 😔 results found for '\(vm.searchQuery)' 😖!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.myColor)
                } else if vm.movies.isEmpty {
                    SearchSmthView(imageName: "searchImage", message: "Please, search something 🤩")
                } else {
                    List(vm.movies) { movie in
                        NavigationLink(
                            destination: SearchDetailView(movie: movie, movieNamespace: movieNamespace)
                                .navigationTransition(.zoom(sourceID: movie.id, in: movieNamespace))
                        ) {
                            MovieCardView(movie: movie, movieNamespace: movieNamespace)
                                .listRowSeparator(.hidden)
                                .matchedTransitionSource(id: movie.id, in: movieNamespace)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .alert(item: $vm.alertItem) { alertItem in
                        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                    }
                }
            }
            .navigationTitle("🔎 Search Your Movies 🌟")
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $vm.searchQuery, prompt: "Search Movies")
        .onChange(of: vm.searchQuery) {
            if vm.searchQuery.isEmpty {
                // Clear results if query is empty
            } else {
                Task {
                    await vm.searchMovies(query: vm.searchQuery)
                }
            }
        }
        .onSubmit(of: .search) {
            if !vm.searchQuery.isEmpty {
                Task {
                    await vm.searchMovies(query: vm.searchQuery)
                }
            }
        }
    }
}


#Preview {
    SearchView()
        .preferredColorScheme(.dark)
}


