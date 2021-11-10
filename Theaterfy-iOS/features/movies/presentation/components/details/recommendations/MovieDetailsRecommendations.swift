//
//  MovieDetailsRecommendations.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct MovieDetailsRecommendations: View {
    var state: MovieDetailsRecommendationsState
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(MoviesLocales.recommendations)
                .foregroundColor(.accentColor)
                .font(.title)
                .bold()
                .padding(20)
            
            switch (state) {
            case .Loading:
                LoadingProgress()
            case .Failure(let error):
                ErrorMessage(message: error)
            case .Success(let result):
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(result) { item in
                            GeometryReader { geo in
                                MovieItem(movie: item)
                                    .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 94) / -20), axis: (x: 0, y: 1, z: 0))
                            }
                            .padding(.leading, result.first!.id == item.id ? 16 : 0)
                            .padding(.trailing, result.last!.id == item.id ? 16 : 0)
                            .frame(idealWidth: 220, idealHeight: 270)
                        }
                    }
                    .padding(.vertical, 20)
                }
            }
        }
    }
}
//
//struct MovieDetailsRecommendations_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsRecommendations()
//    }
//}
