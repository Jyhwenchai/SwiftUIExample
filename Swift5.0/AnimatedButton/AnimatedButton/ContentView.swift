//
//  ContentView.swift
//  AnimatedButton
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    CustomButton {
      HStack(spacing: 10, content: {
        Text("Login")
        Image(systemName: "chevron.right")
      })
      .fontWeight(.bold)
      .foregroundStyle(.green)
    } action: {
      try? await Task.sleep(for: .seconds(2))
//      return .failed("Password Incorrect!")
//      return .success
      return .idle
    }
  }
}



#Preview {
  ContentView()
}
