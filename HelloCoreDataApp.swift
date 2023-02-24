//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Tilek on 5/12/22.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
