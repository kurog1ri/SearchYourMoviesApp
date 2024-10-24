//
//  ErrorAlert.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 20.09.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContent {
    //MARK: network alerts
    static let invalidData       = AlertItem(title: Text("Server Error!"),
                                             message: Text("The data received from the server was invalid 🙁. Please contact support 🙌."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidResponse   = AlertItem(title: Text("Server Error!"),
                                             message: Text("404 Error 🙁. Please try again later or contact support 🙌."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidURL        = AlertItem(title: Text("Server Error!"),
                                             message: Text("There was an issue connecting to the sever 🙁. If the this    persits, please contact support 🙌."),
                                             dismissButton: .default(Text("OK")))
    
    static let unableToComplete  = AlertItem(title: Text("Server Error!"),
                                             message: Text("Unable to comlete your request this time 🙁. Please check your internet connection 🙌."),
                                             dismissButton: .default(Text("OK")))
}


