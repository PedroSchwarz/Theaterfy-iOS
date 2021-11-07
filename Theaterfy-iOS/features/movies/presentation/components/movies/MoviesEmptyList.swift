//
//  EmptyList.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct MoviesEmptyList: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(MoviesLocales.emptyListTitle)
                .font(.title2)
                .bold()
            
            Text(MoviesLocales.emptyListSubtitle)
            
            HStack(alignment: .bottom, spacing: 30) {
                VStack {
                    Image(systemName: MoviesIcons.watchLater)
                        .padding()
                        .background(Circle().stroke(lineWidth: 2).fill(CommonColors.WatchLaterColor))
                    
                    Text(MoviesLocales.emptyListWatchLater)
                }
                .foregroundColor(CommonColors.WatchLaterColor)
                
                VStack {
                    Image(systemName: MoviesIcons.favorite)
                        .padding()
                        .background(Circle().stroke(lineWidth: 2).fill(CommonColors.FavoriteColor))
                    
                    Text(MoviesLocales.emptyListFavorites)
                }
                .foregroundColor(CommonColors.FavoriteColor)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(CommonColors.SteelBlueColor)
        .multilineTextAlignment(.center)
        .frame(height: CommonProperties.screenHeight / 2)
    }
}

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesEmptyList()
    }
}
