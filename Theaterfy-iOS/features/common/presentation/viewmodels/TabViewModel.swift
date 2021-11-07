//
//  TabViewModel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import Foundation

class TabViewModel : ObservableObject {
    @Published var activeTab: TabState = .NowPlayingTab
    
    func setActiveTab(_ tab: TabState) {
        activeTab = tab
    }
    
    func goToNextTab() {
        if activeTab == .NowPlayingTab {
            setActiveTab(.WatchLaterTab)
        } else if activeTab == .WatchLaterTab {
            setActiveTab(.FavoritesTab)
        }
    }
    
    func goToPreviousTab() {
        if activeTab == .FavoritesTab {
            setActiveTab(.WatchLaterTab)
        } else if activeTab == .WatchLaterTab {
            setActiveTab(.NowPlayingTab)
        }
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

enum TabState : CaseIterable {
    case NowPlayingTab
    case SearchTab
    case WatchLaterTab
    case FavoritesTab
}
