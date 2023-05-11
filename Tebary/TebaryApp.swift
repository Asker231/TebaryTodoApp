//
//  TebaryApp.swift
//  Tebary
//
//  Created by ASKER on 09.05.2023.
//

import SwiftUI
import FirebaseCore
@main
struct TebaryApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
