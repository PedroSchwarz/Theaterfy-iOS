//
//  ErrorMessage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct ErrorMessage: View {
    var message: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(self.message)
            Spacer()
        }
        .frame(height: CommonProperties.screenHeight / 2)
    }
}

struct ErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessage(
            message: "Unknow error"
        )
    }
}
