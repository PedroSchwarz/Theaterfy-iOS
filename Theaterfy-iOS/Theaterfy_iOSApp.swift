//
//  Theaterfy_iOSApp.swift
//  Theaterfy-iOS
//
//  Created by Pedro Rodrigues on 24/10/21.
//

import SwiftUI

@main
struct Theaterfy_iOSApp: App {
    init() {
        AppModules.initContainer()
    }

    var body: some Scene {
        WindowGroup {
            MoviesPage()
        }
    }
}
