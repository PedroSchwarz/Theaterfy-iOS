//
//  NumberConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

func formatCurrency(amount: Int) -> String {
    let formatter = NumberFormatter()
    formatter.currencySymbol = "$"
    formatter.numberStyle = .currency
    let value = formatter.string(from: NSNumber(value: amount))
    return value ?? "Value not available"
}
