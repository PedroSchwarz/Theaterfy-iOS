//
//  MovieDetailsActions.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct MovieDetailsActions: View {
    var watchLater: Bool
    var favorite: Bool
    var onWatchLater: () -> Void
    var onFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                onWatchLater()
            } label: {
                Image(systemName: watchLater ? MoviesIcons.watchLater : MoviesIcons.unwatchLater)
                    .padding(10)
                    .background(Circle().stroke(lineWidth: 2).fill(CommonColors.WatchLaterColor))
                    .foregroundColor(CommonColors.WatchLaterColor)
                    .opacity(watchLater ? 1 : 0.5)
                    .animation(.easeOut(duration: 1), value: watchLater)
            }
            
            Button {
                onFavorite()
            } label: {
                Image(systemName: favorite ? MoviesIcons.favorite : MoviesIcons.unfavorite)
                    .padding(10)
                    .background(Circle().stroke(lineWidth: 2).fill(CommonColors.FavoriteColor))
                    .foregroundColor(CommonColors.FavoriteColor)
                    .opacity(favorite ? 1 : 0.5)
                    .animation(.easeOut(duration: 1), value: favorite)
            }
        }
    }
}
//
//struct MovieDetailsActions_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsActions()
//    }
//}
