//
//  LoginView.swift
//  MealPlanner
//
//  Created by 蔡志文 on 1/12/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
      VStack(spacing: 0) {
        ZStack {
          Image(.loginBg)
            .resizable()
            .overlay {
              Rectangle()
                .fill(LinearGradient(colors: [Color.mainPurple.opacity(0), Color.mainPurple], startPoint: .top, endPoint: .bottom))
            }
        }
        ZStack {
          Color(.mainPurple)
          VStack(spacing: 12) {
            Spacer()
            SignUpButton()
            SignUpSeparator()
            LoginTypeButton(icon: .loginGoogle, title: "Continue with Google")
            LoginTypeButton(icon: .loginFacebook, title: "Continue with Facebook")
            LoginTypeButton(icon: .loginApple, title: "Continue with Apple")
            bottomView
          }
          .padding(.horizontal, 20)
          .safeAreaPadding(.bottom)
          .padding(.bottom, 34)
        }
      }
      .ignoresSafeArea()
    }

  @ViewBuilder
  func SignUpButton() -> some View {
    Button(action: {}) {
      Text("Sign up with email")
    }
    .frame(height: 50)
    .frame(maxWidth: .infinity)
    .foregroundStyle(Color.white)
    .fontWeight(.bold)
    .background(Color(hex: "060606"))
    .clipShape(.rect(cornerRadius: 8))
  }

  @ViewBuilder
  func SignUpSeparator() -> some View {
    HStack(spacing: 12) {
      Color.white
        .frame(height: 1)
        .frame(maxWidth: .infinity)
      Text("or use social sign up")
        .foregroundStyle(.white)
        .layoutPriority(1)
      Color.white
        .frame(height: 1)
        .frame(maxWidth: .infinity)
    }
  }

  @ViewBuilder
  func LoginTypeButton(icon: ImageResource, title: String) -> some View {
    Button(action: {}) {
      HStack(spacing: 10, content: {
        Image(icon)
        Text(title)
      })
    }
    .frame(height: 44)
    .frame(maxWidth: .infinity)
    .foregroundStyle(Color.black)
    .fontWeight(.bold)
    .background(Color.white)
    .clipShape(.rect(cornerRadius: 8))
  }

  var bottomView: some View {
    HStack(spacing: 2) {
      Text("Already have account?")
      Text("Log In")
        .underline()
        .fontWeight(.bold)
    }
    .foregroundStyle(Color.white)
  }
}

#Preview {
    LoginView()
}
