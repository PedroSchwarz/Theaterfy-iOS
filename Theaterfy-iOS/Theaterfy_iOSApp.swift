//
//  Theaterfy_iOSApp.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 24/10/21.
//

import SwiftUI

@main
struct Theaterfy_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MoviesListPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
