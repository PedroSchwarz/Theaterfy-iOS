//
//  SearchBar.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 07/11/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var query: String
    var onSearch: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search movie", text: $query)
                    .keyboardType(.default)
                    .font(.title)
                    .padding(10)
                
                Button {
                    onSearch()
                } label: {
                    Image(systemName: "chevron.right")
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
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(query: .constant("Back to")) {
            print("search")
        }
    }
}
