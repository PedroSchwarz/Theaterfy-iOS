//
//  SectionHeader.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct SectionHeader: View {
    var icon: String
    var label: String
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25, height: 25)
            
            Text(label)
                .font(.headline)
                .bold()
            
            Spacer()
        }
        .foregroundColor(.accentColor)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(icon: "face.smiling", label: "Popularity")
    }
}
