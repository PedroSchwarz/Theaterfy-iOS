//
//  MovieDetailsProfit.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct MovieDetailsProfit: View {
    var revenue: String
    var budget: String
    var profit: String
    
    var body: some View {
        DisclosureGroup {
            VStack(alignment: .center) {
                Divider()
                
                VStack(alignment: .leading, spacing: 20) {
                    MovieDetailsProfitItem(label: MoviesLocales.budgetOf, amount: budget)
                    MovieDetailsProfitItem(label: MoviesLocales.revenueOf, amount: revenue)
                    MovieDetailsProfitItem(label: MoviesLocales.profitOf, amount: profit)
                }
                .padding(.vertical)
            }
            .padding(.top, 20)
        } label: {
            SectionHeader(icon: MoviesIcons.profit, label: MoviesLocales.profit)
        }
        .padding(.top, 10)
    }
}

struct MovieDetailsProfit_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsProfit(revenue: "10000", budget: "100000", profit: "100000")
    }
}
