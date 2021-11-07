//
//  LatestMovieAnimations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import SwiftUI

struct LatestMovieAnimations {
    static func calcOffset(minY: CGFloat) -> CGFloat {
        if minY <= -358 {
            return -358
        }
        
        if minY < 0 {
            return minY / 2
        }
        
        return 0
    }
    
    static func calcOpacity(minY: CGFloat) -> CGFloat {
        if minY < 0.4 {
            return 0.4
        }
        
        if minY > 1 {
            return 1
        }
        
        return minY + 0.3
    }
    
    static func calcBlur(minY: CGFloat) -> CGFloat {
        if (-minY < 0) {
            return 0
        }
        
        if (-minY / 50 > 20) {
            return 20
        }
        
        return -minY / 50
    }
    
    static func calcScale(minY: CGFloat) -> CGFloat {
        let scale = (-minY / 3000) + 1
        
        if scale > 1.05 {
            return 1.05
        }
        
        if scale <= 1 {
            return 1
        }
        
        return scale
    }
}
