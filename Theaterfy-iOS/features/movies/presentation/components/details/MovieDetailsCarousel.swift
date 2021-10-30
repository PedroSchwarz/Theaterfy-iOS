//
//  MovieDetailsCarousel.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsCarousel: View {
    var images: [String?]
    var size: CGFloat
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                MovieImage(image: image, size: size)
                    .frame(width: CommonProperties.screenWidth)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: size)
    }
}

struct MovieDetailsCarousel_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieDetailsCarousel(images: [movie.posterUrl, movie.backdropUrl], size: 400)
    }
}
