//
//  StringConverter.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation

extension String {
    func urlEncoded() -> String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
