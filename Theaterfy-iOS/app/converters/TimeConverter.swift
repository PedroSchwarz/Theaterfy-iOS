//
//  NumberConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

func minutesToHours(runtime: Int) -> String {
    return "\(runtime / 60)h \(runtime % 60)min"
}
