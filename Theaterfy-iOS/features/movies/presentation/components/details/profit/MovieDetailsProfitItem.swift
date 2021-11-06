//
//  MovieDetailsProfitItem.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsProfitItem: View {
    var label: String
    var amount: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(amount)
                .foregroundColor(.accentColor)
                .font(.title3)
                .bold()
        }
    }
}

struct MovieDetailsProfitItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsProfitItem(label: "Test of", amount: "10000")
    }
}
