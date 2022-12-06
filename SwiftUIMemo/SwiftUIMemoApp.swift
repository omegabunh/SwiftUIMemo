//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 박성우 on 2022/12/06.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
