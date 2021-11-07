//
//  NumberConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

extension Int {
    func hoursFormat() -> String {
        return "\(self / 60)h \(self % 60)min"
    }
}
