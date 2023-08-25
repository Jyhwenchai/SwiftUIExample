//
//  TipKitEGApp.swift
//  TipKitEG
//
//  Created by 蔡志文 on 8/8/23.
//

import SwiftUI
import TipKit

@main
struct TipKitEGApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView()
            .task {
              do {
                try await Tips.configure() {
                  DisplayFrequency(.immediate)
                  DatastoreLocation(.applicationDefault)
                }
              } catch {
                print(error.localizedDescription)
              }
            }
        }
    }
}
