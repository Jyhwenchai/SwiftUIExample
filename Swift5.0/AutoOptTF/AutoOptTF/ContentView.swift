//
//  ContentView.swift
//  AutoOptTF
//
//  Created by 蔡志文 on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        OTPVerificationView()
          .navigationBarTitleDisplayMode(.inline)
          .toolbar(.hidden, for: .navigationBar)
      }
    }
}

#Preview {
    ContentView()
}
