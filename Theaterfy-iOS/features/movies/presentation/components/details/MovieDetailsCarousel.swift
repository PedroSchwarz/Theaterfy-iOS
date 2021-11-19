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
    var onDismiss: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                TabView {
                    ForEach(images, id: \.self) { image in
                        GeometryReader { card in
                            MovieImage(image: image, size: size)
                                .scaleEffect(
                                    y: MovieDetailsCarouselAnimations.calcImageCardScale(minX: card.frame(in: .global).minX),
                                    anchor: .top
                                )
                        }
                        .frame(width: CommonProperties.screenWidth)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: size)
                .scaleEffect(y: MovieDetailsCarouselAnimations.calcScale(minY: geo.frame(in: .global).minY), anchor: .top)
                .offset(y: MovieDetailsCarouselAnimations.calcOffset(minY: geo.frame(in: .global).minY))
                .blur(radius: MovieDetailsCarouselAnimations.calcBlur(minY: geo.frame(in: .global).minY))
                .opacity(MovieDetailsCarouselAnimations.calcOpacity(minY: geo.frame(in: .global).minY))
                
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: CommonIcons.arrowLeft)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Circle()
                                .fill(CommonColors.SteelBlueColor)
                                .padding(8)
                                .background(
                                    Circle()
                                        .fill(Color.secondary)
                                )
                        )
                }
                .shadow(color: CommonColors.ShadowColor, radius: 5, x: 0, y: 2)
                .position(x: 40, y: 70)
                .offset(y: MovieDetailsCarouselAnimations.calcOffset(minY: geo.frame(in: .global).minY))
                .blur(radius: MovieDetailsCarouselAnimations.calcBlur(minY: geo.frame(in: .global).minY))
                .opacity(MovieDetailsCarouselAnimations.calcOpacity(minY: geo.frame(in: .global).minY))
            }
        }
        .frame(width: CommonProperties.screenWidth, height: size)
    }
}

struct MovieDetailsCarousel_Previews: PreviewProvider {
    static let movie = MovieModel.dumbInstance().toEntity()
    
    static var previews: some View {
        MovieDetailsCarousel(images: [movie.posterUrl, movie.backdropUrl], size: 400) { }
    }
}
