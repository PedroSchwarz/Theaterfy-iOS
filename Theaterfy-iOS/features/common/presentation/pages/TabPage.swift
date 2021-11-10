//
//  TabView.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct TabPage: View {
    @StateObject private var viewModel = AppModules.container.resolve(TabViewModel.self)!
    
    var body: some View {
        NavigationView {
            ScrollView {
                TabController()
                
                TabControllerView()
            }
        }
        .environmentObject(viewModel)
    }
}

struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
    }
}
