//
//  MovieDetailsCarouselAnimations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 10/11/21.
//

import Foundation
import SwiftUI

struct MovieDetailsCarouselAnimations {
    static func calcOpacity(minY: CGFloat) -> CGFloat {
        if minY < 0 {
            let opacity = 1 + (minY / 100)
            
            if opacity < 0.4 {
                return 0.4
            }
            
            return opacity
        }
        
        return 1
    }
    
    static func calcOffset(minY: CGFloat) -> CGFloat {
        return -minY
    }
    
    static func calcScale(minY: CGFloat) -> CGFloat {
        let scale = minY / 900 + 1
        
        if scale < 0.8 {
            return 0.8
        }
        
        return scale
    }
    
    static func calcBlur(minY: CGFloat) -> CGFloat {
        if minY < 0 {
            let blur = -minY / 50
            
            if blur > 10 {
                return 10
            }
            return blur
        }
        
        return 0
    }
}
