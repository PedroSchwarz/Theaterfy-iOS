//
//  MovieDetailsCompanies.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 03/11/21.
//

import SwiftUI

struct MovieDetailsCompanies: View {
    var companies: [ProductionCompany]
    
    var body: some View {
        MovieDetailsList(type: .Companies) {
            ForEach(companies) { item in
                MovieDetailsListCapsule(label: item.name)
                    .padding(.leading, companies.first!.id == item.id ? 16 : 0)
                    .padding(.trailing, companies.last!.id == item.id ? 16 : 0)
            }
        }
        .padding(.top, 10)
    }
}
//
//struct MovieDetailsCompanies_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsCompanies()
//    }
//}
