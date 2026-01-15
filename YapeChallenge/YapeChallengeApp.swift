//
//  YapeChallengeApp.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-12.
//

import SwiftUI
import GoogleMaps

@main
struct YapeChallengeApp: App {
    
    init() {
        GMSServices.provideAPIKey(K.Keys.GOOGLE_API_KEY)
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
    }
}
