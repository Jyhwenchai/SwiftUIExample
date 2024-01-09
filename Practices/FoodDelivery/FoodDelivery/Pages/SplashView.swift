//
//  SplashView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/3/24.
//

import SwiftUI

struct SplashView: View {
  var body: some View {
    ZStack {
      Color.mainPurple
      Image(.splashBg)
        .resizable()
      VStack {
        HStack {
          Image(.splashLogo)
          Spacer()
        }
        .padding(.top, 44)
        .padding(.leading, 0)

        Spacer()

        VStack(spacing: 0) {
          Image(.splashDropIcon)

          Spacer()
            .frame(height: 24)

          Text("Non-Contact \nDeliveries")
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.system(size: 34))
            .fontWeight(Font.Weight.bold)
            .foregroundStyle(Color.textPrimary)
            .layoutPriority(2)

          Text("When placing an order, select the option “Contactless delivery” and the courier will leave your order at the door.")
            .multilineTextAlignment(.center)
            .font(.system(size: 17))
            .foregroundStyle(Color.textSecondary)
            .padding(.top, 25)


          Spacer()
            .frame(height: 48)

          VStack(spacing: 32) {
            Button(action: {}, label: {
              Text("ORDER NOW")
                .foregroundStyle(Color.white)
            })
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(Color.primaryButton)
            .clipShape(.rect(cornerRadius: 8))

            Button(action: {}) {
              Text("DISMISS")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .tint(Color.textSecondary)
            }
          }
          .safeAreaPadding(.bottom)
          .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 44)
        .background {
          Color(hex: "#f6f5f5")
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 40, topTrailing: 40)))
        }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  SplashView()
}
