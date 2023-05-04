//
//  DaytaApp.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

@main
struct DaytaApp: App {
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
