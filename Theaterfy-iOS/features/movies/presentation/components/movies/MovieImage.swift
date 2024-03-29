//
//  MovieImage.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 27/10/21.
//

import SwiftUI
import Kingfisher

struct MovieImage: View {
    var image: String?
    var size: CGFloat = 120
    
    var body: some View {
        if let url = self.image {
            KFImage.url(URL(string: url)!)
                .placeholder({
                    VStack {
                        HStack {
                            Spacer()
                            LoadingProgress()
                            Spacer()
                        }
                    }
                    .background(Color.secondary.opacity(0.2))
                })
                .cacheMemoryOnly()
                .fade(duration: 0.1)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: self.size)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            LoadingProgress()
        }
    }
}

struct MovieImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieImage()
    }
}
