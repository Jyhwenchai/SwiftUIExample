//
//  ContentView.swift
//  SecureFieldSample
//
//  Created by 蔡志文 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
  @State private var password: String = ""
  var body: some View {
    Form {
      Section("Basic") {
        SecureField("password", text: $password)
          .textFieldStyle(.plain)
          .autocorrectionDisabled()
          .onSubmit {
            print("password: \(password)")
          }
      }
    }
  }
}

#Preview {
    ContentView()
}
