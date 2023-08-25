//
//  Login.swift
//  LoginKit
//
//  Created by 蔡志文 on 8/21/23.
//

import SwiftUI

struct Login: View {
  @Binding var showSignup: Bool
  @State private var emailID: String = ""
  @State private var password: String = ""
  @State private var showForgotPasswordView = false
  @State private var showResetView = false
  @State private var askOTP = false
  @State private var otpText = ""
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      Spacer(minLength: 0)

      Text("Login")
        .font(.largeTitle)
        .fontWeight(.heavy)

      Text("Please sign in to continue")
        .font(.callout)
        .fontWeight(.semibold)
        .foregroundStyle(.gray)
        .padding(.top, -5)

      VStack(spacing: 25, content: {
        CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
        CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
          .padding(.top, 5)

        Button("Forgot Password?") {
          showForgotPasswordView.toggle()
        }
        .font(.callout)
        .fontWeight(.heavy)
        .tint(.appYellow)
        .hSpacing(.trailing)

        GradientButton(title: "Login", icon: "arrow.right") {
          askOTP.toggle()
        }
        .hSpacing(.trailing)
        .disableWithOpacity(emailID.isEmpty || password.isEmpty)
      })
      .padding(.top, 20)

      Spacer(minLength: 0)

      HStack(spacing: 6, content: {
        Text("Don't have an account?")
          .foregroundStyle(.gray)

        Button("SignUp") {
          showSignup.toggle()
        }
        .fontWeight(.bold)
        .tint(.appYellow)
      })
    }
    .padding(.vertical, 15)
    .padding(.horizontal, 25)
    .toolbar(.hidden, for: .navigationBar)
    .sheet(isPresented: $showForgotPasswordView, content: {
      if #available(iOS 16.4, *) {
        ForgotPassword(showResetView: $showResetView)
          .presentationDetents([.height(300)])
          .presentationCornerRadius(30)
      } else {
        ForgotPassword(showResetView: $showResetView)
          .presentationDetents([.height(300)])
      }
    })
    .sheet(isPresented: $showResetView, content: {
      if #available(iOS 16.4, *) {
        PasswordResetView()
          .presentationDetents([.height(350)])
          .presentationCornerRadius(30)
      } else {
        PasswordResetView()
          .presentationDetents([.height(350)])
      }
    })
    .sheet(isPresented: $askOTP, content: {
      if #available(iOS 16.4, *) {
        OTPView(otpText: $otpText)
          .presentationDetents([.height(350)])
          .presentationCornerRadius(30)
      } else {
        OTPView(otpText: $otpText)
          .presentationDetents([.height(350)])
      }
    })
  }
}

#Preview {
  ContentView()
}
