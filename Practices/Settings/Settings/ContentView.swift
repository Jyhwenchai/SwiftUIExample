//
//  ContentView.swift
//  Settings
//
//  Created by 蔡志文 on 5/4/23.
//

import SwiftUI

struct ContentView: View {
  let sections = SettingsData.datas

  var body: some View {
    NavigationStack {
      List {
        SettingsFirstSection()
        ForEach(sections) { section in
          SettingsNormalSection(section: section)
        }
      }
      .navigationTitle("Settings")
      .listStyle(.insetGrouped)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
