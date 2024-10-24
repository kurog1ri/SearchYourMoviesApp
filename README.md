# Search Your Movies App

## Overview

The Movie Search App is an iOS application built using SwiftUI, targeting iOS 18. It allows users to search for movies, view detailed information, and manage their favorites list. The app features modern navigation animations, including a zoom transition that leverages iOS 18's new `navigationTransition` and `matchedTransitionSource` capabilities.

## Features

- **Movie Search**: Search movies by title, leveraging a third-party movie API.
- **Detail View**: View detailed information about movies, such as title, release date, runtime, rating, and an overview.
- **Favorites**: Add and remove movies from a favorites list.
- **Zoom Transition**: Utilize iOS 18's zoom transition effect when navigating between the list view and detail view.

## Project Structure

The app is divided into several components:

- **Views**: 
  - `SearchView`: Main view with a search bar and movie list.
  - `MovieCardView`: Displays summary info for each movie in the list.
  - `SearchDetailView`: Detailed view of a movie, accessed via navigation link.
  - `FavoriteView`: Shows all favorite movies, with the ability to remove them.
  
- **View Models**:
  - `MovieViewModel`: Handles movie search and state management.
  - `FavoriteManager`: Manages favorite movies in the app.

- **Networking**:
  - Networking logic is written in a separate layer, with API requests handled asynchronously using Swift's `async/await` syntax.

## Key Technologies

- **SwiftUI**: Utilizes Swift's declarative UI framework for a responsive and elegant interface.
- **Namespace-based Animations**: Implements the zoom transition between movie cards and details using `@Namespace` and `navigationTransition`.
- **Async/Await**: Asynchronous API calls are made using modern Swift concurrency patterns.
- **Combine**: State and data binding in the app is powered by Combine, ensuring smooth UI updates.

## How to Use

1. **Search Movies**: Use the search bar to type in movie titles. The app will fetch and display the relevant results.
2. **View Details**: Tap on any movie to view its details, where you'll see the title, release date, runtime, and more.
3. **Add to Favorites**: Press the heart icon to add or remove a movie from your favorites list.

## iOS 18 Zoom Transition

One of the key features is the zoom transition between movie cards and the detail view. This is achieved using the new `@Namespace` and transition APIs introduced in iOS 18.

### Code Example

```swift
@Namespace private var movieNamespace

List(vm.movies) { movie in
    NavigationLink(destination: SearchDetailView(movie: movie, movieNamespace: movieNamespace)) {
        MovieCardView(movie: movie, movieNamespace: movieNamespace)
            .matchedTransitionSource(id: movie.id, in: movieNamespace)
            .navigationTransition(.zoom(sourceID: movie.id, in: movieNamespace))
    }
}
