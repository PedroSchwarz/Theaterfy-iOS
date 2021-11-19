//
//  TabView.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct TabControllerView: View {
    @ObservedObject var viewModel: TabViewModel
    
    var body: some View {
        switch viewModel.activeTab {
        case TabState.NowPlayingTab.rawValue:
            MoviesPage()
        case TabState.SearchTab.rawValue:
            SearchMoviesPage()
        case TabState.WatchLaterTab.rawValue:
            CachedMoviesPage(type: .WatchLaterAction)
        default:
            CachedMoviesPage(type: .FavoriteAction)
        }
    }
}
//
//struct TabControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabControllerView()
//    }
//}
