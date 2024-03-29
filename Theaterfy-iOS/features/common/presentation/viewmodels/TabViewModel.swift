//
//  TabViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation

class TabViewModel : ObservableObject {
    @Published var activeTab: String = TabState.NowPlayingTab.rawValue
    
    func setActiveTab(_ tab: TabState) {
        activeTab = tab.rawValue
    }
    
    func mapTabToLabel(_ tab: TabState) -> String {
        switch tab {
        case .NowPlayingTab:
            return RoutesLocales.nowPlayingRouteName
        case .SearchTab:
            return RoutesLocales.searchRouteName
        case .WatchLaterTab:
            return RoutesLocales.watchLaterRouteName
        case .FavoritesTab:
            return RoutesLocales.favoritesRouteName
        }
    }
    
    func mapTabToIcon(_ tab: TabState) -> String {
        switch tab {
        case .NowPlayingTab:
            return MoviesIcons.nowPlaying
        case .SearchTab:
            return MoviesIcons.search
        case .WatchLaterTab:
            return MoviesIcons.watchLater
        case .FavoritesTab:
            return MoviesIcons.favorite
        }
    }
}

enum TabState : String, CaseIterable {
    case NowPlayingTab = "NowPlayingTab"
    case SearchTab = "SearchTab"
    case WatchLaterTab = "WatchLaterTab"
    case FavoritesTab = "FavoritesTab"
}
