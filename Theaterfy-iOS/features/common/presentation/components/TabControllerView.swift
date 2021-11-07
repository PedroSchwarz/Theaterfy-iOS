//
//  TabView.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct TabControllerView: View {
    @EnvironmentObject private var viewModel: TabViewModel
    
    var body: some View {
        switch viewModel.activeTab {
        case .NowPlayingTab:
            MoviesPage()
                .transition(.opacity.animation(Animation.linear(duration: 0.5)))
        case .WatchLaterTab:
            CachedMoviesPage(type: .WatchLaterAction)
                .transition(.opacity.animation(Animation.linear(duration: 0.5)))
        case .FavoritesTab:
            CachedMoviesPage(type: .FavoriteAction)
                .transition(.opacity.animation(Animation.linear(duration: 0.5)))
        }
    }
}

struct TabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabControllerView()
    }
}
