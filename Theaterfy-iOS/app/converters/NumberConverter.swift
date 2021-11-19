//
//  NumberConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

extension Int {
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.currencySymbol = "$"
        formatter.numberStyle = .currency
        let value = formatter.string(from: NSNumber(value: self))
        return value ?? "Value not available"
    }
}
