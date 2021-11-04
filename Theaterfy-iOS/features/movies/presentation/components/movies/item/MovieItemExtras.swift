//
//  MovieItemExtras.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI

struct MovieItemExtras: View {
    var votes: Double
    var releaseDate: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            MoviesScore(size: 40, value: votes)
            
            Spacer()
            
            Text(self.releaseDate)
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .foregroundColor(CommonColors.SteelBlueColor)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct MovieItemExtras_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieItemExtras(
            votes: movie.voteAverage,
            releaseDate: movie.releaseDate
        )
    }
}
