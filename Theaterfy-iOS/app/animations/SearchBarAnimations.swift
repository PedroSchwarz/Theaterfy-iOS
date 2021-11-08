//
//  SearchBarAnimation.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import SwiftUI

struct SearchBarAnimations {
    static func calcOffset(minY: CGFloat) -> CGFloat {
        if -minY > 20.0 {
            return -minY - 40
        }
        
        if -minY <= 0 {
            return 0
        }
        
        return minY
    }
    
    static func calcOpacity(minY: CGFloat) -> CGFloat {
        if minY <= 0 {
            return 0
        }
        
        if minY >= 1 {
            return 1
        }
        
        return minY / 2
    }
}
