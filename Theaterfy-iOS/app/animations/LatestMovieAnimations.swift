//
//  LatestMovieAnimations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import Foundation
import SwiftUI

struct LatestMovieAnimations {
    static func calcOffsetImage(minY: CGFloat) -> CGFloat {
        if minY <= -600 {
            return -600
        }
        
        if minY < 0 {
            return minY / -8
        }
        
        return 0
    }
    
    static func calcOffset(minY: CGFloat) -> CGFloat {
        if minY <= -600 {
            return -600
        }
        
        if minY < 0 {
            return minY / 5
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
        
        if (-minY / 70 > 15) {
            return 15
        }
        
        return -minY / 70
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
