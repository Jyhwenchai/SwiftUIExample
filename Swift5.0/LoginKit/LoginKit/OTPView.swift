//
//  Login.swift
//  LoginKit
//
//  Created by 蔡志文 on 8/21/23.
//

import SwiftUI

struct OTPView: View {
  @Binding var otpText: String
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Button {
        dismiss()
      } label: {
        Image(systemName: "arrow.left")
          .font(.title2)
          .foregroundStyle(.gray)
      }
      .padding(.top, 15)


      Text("Input Code")
        .font(.largeTitle)
        .fontWeight(.heavy)
        .padding(.top, 25)

      Text("An 6 digit code has been sent to your Email ID.")
        .font(.caption)
        .fontWeight(.semibold)
        .foregroundStyle(.gray)
        .padding(.top, -5)

      VStack(spacing: 25, content: {
        OTPVerificationView(otpText: $otpText)
        GradientButton(title: "Send Link", icon: "arrow.right") {

        }
        .hSpacing(.trailing)
        .disableWithOpacity(otpText.isEmpty)
      })
      .padding(.top, 20)

      Spacer(minLength: 0)
    }
    .padding(.vertical, 15)
    .padding(.horizontal, 25)
    .interactiveDismissDisabled()
  }
}

#Preview {
  ContentView()
}
