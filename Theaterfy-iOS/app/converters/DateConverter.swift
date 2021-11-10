//
//  DateConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import Foundation

extension String {
    func dateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let newDate = formatter.date(from: self)
        formatter.dateFormat = "MMM d, yyyy"
        if let date = newDate {
            return formatter.string(from: date)
        } else {
            return "Date unavailable"
        }
    }
}

