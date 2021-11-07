//
//  CommonGestures.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import UIKit

struct CommonGestures {
    static let feedback = UIImpactFeedbackGenerator(style: .medium)
    
    static func makeHapticFeedback() {
        feedback.impactOccurred()
    }
}
