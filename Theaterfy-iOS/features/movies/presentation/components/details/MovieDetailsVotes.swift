//
//  MovieDetailsVotes.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsVotes: View {
    var average: Double
    var total: Int
    
    var body: some View {
        VStack {
            Divider()
            
            HStack(spacing: 30) {
                Text(String(average))
                    .font(.largeTitle)
                
                
                VStack(alignment: .leading) {
                    Text("Rated by")
                        .font(.title3)
                    Text("\(total) \(MoviesLocales.users)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
            }
            .padding()
        }
        .padding(.top, 30)
    }
}

struct MovieDetailsVotes_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsVotes(average: 7.5, total: 900)
    }
}
