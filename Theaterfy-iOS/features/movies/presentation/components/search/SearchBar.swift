//
//  SearchBar.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct SearchBar: View {
    @State private var originalY: CGFloat = 0
    @Binding var query: String
    var onSearch: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    TextField(MoviesLocales.searchMovieFieldHint, text: $query)
                        .keyboardType(.default)
                        .font(.title)
                        .padding(10)
                    
                    Button {
                        onSearch()
                    } label: {
                        Image(systemName: CommonIcons.arrowRight)
                            .padding(.horizontal)
                    }
                }
                Divider()
                    .background(
                        Color.accentColor
                    )
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .offset(y: SearchBarAnimations.calcOffset(minY: geo.frame(in: .global).minY - originalY))
            .opacity(SearchBarAnimations.calcOpacity(minY: geo.frame(in: .global).minY / originalY))
            .onAppear {
                originalY = geo.frame(in: .global).minY
            }
        }
        .frame(height: 50)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(query: .constant("Back to")) {
            print("search")
        }
    }
}
