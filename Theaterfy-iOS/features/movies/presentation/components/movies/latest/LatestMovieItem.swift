//
//  LatestMovieItem.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 06/11/21.
//

import SwiftUI

struct LatestMovieItem: View {
    var movie: Movie
    
    @State private var animate: Bool = false
    @State private var originalY: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                MovieImage(image: movie.posterUrl, size: 300)
                    .overlay(LinearGradient(
                        colors: [Color.clear, Color.black.opacity(0.5), Color.black.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                        .cornerRadius(10)
                    )
                    .offset(y: LatestMovieAnimations.calcOffsetImage(minY: geo.frame(in: .global).minY - originalY))
                
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    HStack {
                        Text(movie.title)
                            .font(.title2)
                            .bold()
                            .lineLimit(2)
                            .offset(y: animate ? 0 : 100)
                            .opacity(animate ? 1 : 0)
                            .animation(.easeOut(duration: 0.8), value: animate)
                        
                        Spacer()
                        
                        MoviesScore(size: 60, value: movie.voteAverage, showAnimation: true)
                    }
                    
                    Text(movie.overview)
                        .font(.title3)
                        .lineLimit(3)
                        .offset(y: animate ? 0 : 100)
                        .opacity(animate ? 1 : 0)
                        .animation(.easeOut(duration: 1.2), value: animate)
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding()
//                .background(
//                    LinearGradient(
//                        colors: [Color.clear, Color.black.opacity(0.5), Color.black.opacity(0.6)],
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                        .cornerRadius(10)
//                )
            }
            .shadow(color: Color.black, radius: 20, x: 0, y: 2)
            .offset(y: LatestMovieAnimations.calcOffset(minY: geo.frame(in: .global).minY - originalY))
//            .opacity(LatestMovieAnimations.calcOpacity(minY: geo.frame(in: .global).minY / originalY))
            .blur(radius: LatestMovieAnimations.calcBlur(minY: geo.frame(in: .global).minY - originalY))
            .scaleEffect(
                x: LatestMovieAnimations.calcScale(minY: geo.frame(in: .global).minY - originalY),
                y: LatestMovieAnimations.calcScale(minY: geo.frame(in: .global).minY - originalY),
                anchor: .center
            )
            .onAppear {
                animate = true
                originalY = geo.frame(in: .global).minY
            }
        }
        .frame(height: 300)
    }
}
//
//struct LatestMovieItem_Previews: PreviewProvider {
//    static var previews: some View {
//        LatestMovieItem()
//    }
//}
