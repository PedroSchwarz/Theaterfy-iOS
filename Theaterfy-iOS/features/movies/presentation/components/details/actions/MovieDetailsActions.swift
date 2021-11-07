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
            MovieDetailsActionButton(onClicked: {
                onWatchLater()
                CommonGestures.makeHapticFeedback()
            },
                                     active: watchLater,
                                     activeIcon: MoviesIcons.watchLater,
                                     unactiveIcon: MoviesIcons.unwatchLater,
                                     color: CommonColors.WatchLaterColor
            )
                .help(MoviesLocales.watchLaterHelperText)
            
            MovieDetailsActionButton(onClicked: {
                onFavorite()
                CommonGestures.makeHapticFeedback()
            },
                                     active: favorite,
                                     activeIcon: MoviesIcons.favorite,
                                     unactiveIcon: MoviesIcons.unfavorite,
                                     color: CommonColors.FavoriteColor
            )
                .help(MoviesLocales.favoritesHelperText)
        }
    }
}
//
//struct MovieDetailsActions_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsActions()
//    }
//}
