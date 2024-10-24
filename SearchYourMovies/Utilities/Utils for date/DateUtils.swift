//
//  DateUtils.swift
//  SearchYourMovies
//
//  Created by   Kosenko Mykola on 21.09.2024.
//

import Foundation

struct DateUtils {
    
    static func formatReleaseYear(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let yearFormatter = DateFormatter()
            yearFormatter.dateFormat = "yyyy"
            return yearFormatter.string(from: date)
        } else {
            return "N/A"
        }
    }
}
