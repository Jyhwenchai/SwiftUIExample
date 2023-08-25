//
//  Login.swift
//  LoginKit
//
//  Created by 蔡志文 on 8/21/23.
//

import SwiftUI

struct PasswordResetView: View {
  @State private var password: String = ""
  @State private var confirmPassword: String = ""
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Button {
        dismiss()
      } label: {
        Image(systemName: "xmark")
          .font(.title2)
          .foregroundStyle(.gray)
      }
      .padding(.top, 10)


      Text("Reset Password")
        .font(.largeTitle)
        .fontWeight(.heavy)
        .padding(.top, 25)

      VStack(spacing: 25, content: {
        CustomTF(sfIcon: "lock", hint: "Password", value: $password)
        CustomTF(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)

        GradientButton(title: "Send Link", icon: "arrow.right") {

        }
        .hSpacing(.trailing)
        .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
      })
      .padding(.top, 20)
    }
    .padding(.vertical, 15)
    .padding(.horizontal, 25)
    .interactiveDismissDisabled()
  }
}

#Preview {
  ContentView()
}
