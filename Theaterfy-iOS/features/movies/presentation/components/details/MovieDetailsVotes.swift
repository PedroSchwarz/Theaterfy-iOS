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
        DisclosureGroup {
            VStack {
                Divider()
                
                HStack(spacing: 30) {
                    MoviesScore(size: 100, value: average, showAnimation: true)
                    
                    VStack(alignment: .leading) {
                        
                        Text(MoviesLocales.ratedBy)
                            .font(.title3)
                        Text("\(total) \(MoviesLocales.users)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.accentColor)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .padding(.top, 20)
        } label: {
            SectionHeader(icon: MoviesIcons.popularity, label: MoviesLocales.popularity)
        }
        .padding(.top, 10)
    }
}

struct MovieDetailsVotes_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsVotes(average: 7.5, total: 900)
    }
}
