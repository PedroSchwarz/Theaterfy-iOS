//
//  MovieDetailsList.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

enum MovieDetailsListTypes {
    case Genres
    case Companies
}

struct MovieDetailsList<Content: View>: View {
    var type: MovieDetailsListTypes
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                switch (type) {
                case .Companies:
                    SectionHeader(icon: MoviesIcons.productionCompanies, label: MoviesLocales.productionCompanies)
                case .Genres:
                    SectionHeader(icon: MoviesIcons.genres, label: MoviesLocales.genres)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    content
                }
                .padding(1)
            }
        }
        .padding(.top, 15)
    }
}

struct MovieDetailsList_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsList(type: .Genres) {
            Text("Hello")
        }
    }
}
