//
//  MoviesRefreshList.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct MoviesRefreshList: View {
    var onAppear: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding(.top, 30)
            .onAppear {
                onAppear()
            }
    }
}

struct MoviesRefreshList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesRefreshList() {
            print("Appear")
        }
    }
}
