//
//  TabGestures.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import SwiftUI

struct TabGestures {
    static let dragGesture: DragGesture = DragGesture(minimumDistance: 0, coordinateSpace: .local)
    
    static func listenDragGesture(_ value: DragGesture.Value, onLeftSwipe: () -> Void, onRightSwipe: () -> Void) {
        if value.translation.width < -CommonProperties.screenWidth / 3 {
            onRightSwipe()
        }
        
        if value.translation.width > CommonProperties.screenWidth / 3 {
            onLeftSwipe()
        }
    }
}
