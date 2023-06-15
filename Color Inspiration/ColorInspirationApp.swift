//
//  ColorInspirationApp.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import SwiftUI
import SwiftData

@main
struct ColorInspirationApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [FavoriteColor.self])
    }
}
