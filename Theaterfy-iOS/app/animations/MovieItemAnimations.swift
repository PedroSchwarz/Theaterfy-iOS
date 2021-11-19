//
//  MovieItemAnimations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 10/11/21.
//

import Foundation
import SwiftUI

struct MovieItemAnimations {
    static func calcOpacity(minY: CGFloat) -> CGFloat {
        let screenLine = CommonProperties.screenHeight / 2.5
        
        if minY > screenLine {
            let opacity = screenLine / minY
            
            if opacity < 0.5 {
                return 0.5
            }
            return opacity
        }
        
        return 1
    }
    
    static func calcOffset(minY: CGFloat) -> CGFloat {
        let screenFirstLine = CommonProperties.screenHeight / 2.5
        
        if minY < screenFirstLine {
            let offset = ((minY - screenFirstLine) / 10) - 30
            
            if offset <= -50 {
                return -50
            }
            return offset
        }
        
        let screenSecondLine = CommonProperties.screenHeight / 1.7
        
        if minY < screenSecondLine {
            let offset = ((minY - screenSecondLine) / 5)
            
            if offset <= -30 {
                return -30
            }
            return offset
        }
        
        return 0
    }
}
