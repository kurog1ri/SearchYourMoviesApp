//
//  SearchSmthView.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 23.09.2024.
//

import SwiftUI

struct SearchSmthView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text(message)
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
    SearchSmthView(imageName: "searchImage", message: "Please, search something 🤩")
}
