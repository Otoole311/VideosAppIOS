//
//  VideosAppApp.swift
//  VideosApp
//
//  Created by Otoole on 22/03/2022.
//

import SwiftUI

@main
struct VideosAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VideoModel())
                .preferredColorScheme(.light)
        }
    }
}
