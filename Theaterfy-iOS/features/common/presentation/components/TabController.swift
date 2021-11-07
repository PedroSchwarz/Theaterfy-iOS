//
//  TabController.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct TabController: View {
    @EnvironmentObject private var viewModel: TabViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(TabState.allCases, id: \.self) { tab in
                    TabControllerButton(
                        active: tab == viewModel.activeTab,
                        label: viewModel.mapTabToLabel(tab),
                        icon: viewModel.mapTabToIcon(tab)
                    ) {
                        viewModel.setActiveTab(tab)
                    }
                        .padding(.leading, tab == .NowPlayingTab ? 10 : 0)
                        .padding(.trailing, tab == .FavoritesTab ? 10 : 0)
                }
            }
            .padding(.vertical, 10)
        }
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
    }
}
