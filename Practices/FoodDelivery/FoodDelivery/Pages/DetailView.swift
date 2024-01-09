//
//  DetailView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/4/24.
//

import SwiftUI

struct DetailView: View {
  @State private var pageIndex = 0
  var body: some View {
    VStack(spacing: 0) {
      TabView {
        Image(.img3)
          .resizable()
          .scaledToFill()
          .tag(0)
          .frame(maxWidth: .infinity)
          .clipped()
        Image(.img4)
          .resizable()
          .scaledToFill()
          .tag(1)
          .frame(maxWidth: .infinity)
          .clipped()
        Image(.img5)
          .resizable()
          .scaledToFill()
          .tag(2)
          .frame(maxWidth: .infinity)
          .clipped()
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .frame(height: 358)
      .frame(maxWidth: .infinity)

      VStack(spacing: 0) {
        VStack(alignment: .leading, spacing: 0) {
          Text("Boston Lettuce")
            .font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundStyle(Color.textPrimary)
          Spacer()
            .frame(height: 16)
          HStack(spacing: 0) {
            Text("1.10")
              .font(.system(size: 32))
              .fontWeight(.bold)
              .foregroundStyle(Color.textPrimary)
            Text("€ / piece")
              .font(.system(size: 24))
              .foregroundStyle(Color.textSecondary)
            Spacer()
          }

          Spacer()
            .frame(height: 8)
          Text("~ 150 gr / piece")
            .font(.system(size: 17))
            .fontWeight(.medium)
            .foregroundStyle(Color(hex: "06BE77"))

          Spacer()
            .frame(height: 32)
          Text("Spain")
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundStyle(Color.textPrimary)

          Spacer()
            .frame(height: 16)
          Text("Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.")
            .multilineTextAlignment(.leading)
            .font(.system(size: 17))
            .foregroundStyle(Color.textSecondary)

          Spacer()

          HStack(spacing: 20) {
            Button {

            } label: {
              Image(systemName: "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color(hex: "9586A8"))
            }
            .frame(width: 78, height: 56)
            .clipShape(.rect(cornerRadius: 8))
            .background(Color.white)
            .overlay {
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "9586a8"), lineWidth: 1.0)
            }


            Button {

            } label: {
              Label(
                title: {
                  Text("add to cart")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                },
                icon: {
                  Image(systemName: "cart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.white)
                }
              )
            }
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(Color.primaryButton)
            .clipShape(.rect(cornerRadius: 8))
          }
        }
        .ignoresSafeArea()
        .padding(.top, 37)
        .padding(.horizontal, 20)
        .padding(.bottom, 1)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.defaultBackground)
      .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
      .offset(y: -15)
      .padding(.bottom, 35)
      .background(Color.defaultBackground)
    }
    .ignoresSafeArea()
  }
}

#Preview {
    DetailView()
}
