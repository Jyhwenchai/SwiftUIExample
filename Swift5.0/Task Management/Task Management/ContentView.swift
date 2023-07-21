//
//  ContentView.swift
//  Task Management
//
//  Created by 蔡志文 on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Home()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.BG)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
