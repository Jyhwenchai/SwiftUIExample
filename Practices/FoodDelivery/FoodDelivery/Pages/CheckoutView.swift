//
//  CheckoutView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/5/24.
//

import SwiftUI

struct CheckoutView: View {
  var body: some View {
    List {
      Section {
        normalRow(image: "creditcard", text: "**** **** **** 4747")
      } header: {
        normalSectionHeader(title: "Payment method")
      } footer: {
//        normalSectionFooter()
      }
      .listRowSeparator(.hidden)
      .listRowBackground(Color.clear)
      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      .listSectionSpacing(.custom(16))

//      Section {
//        normalRow(image: "house", text: """
//        Alexandra Smith
//        Cesu 31 k-2 5.st, SIA Chili
//        Riga
//        LV–1012
//        Latvia
//        """)
//        .frame(height: 100)
//      } header: {
//        normalSectionHeader(title: "Delivery address")
//      } footer: {}
//      .listRowSeparator(.hidden)
//      .listRowBackground(Color.clear)
//      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//      .listSectionSpacing(.custom(32))

      Section {
        normalRow(image: "figure.walk", text: "I’ll pick it up myself")
        normalRow(image: "figure.equestrian.sports", text: "By courier")
        dronRow()
      } header: {
        normalSectionHeader(title: "Delivery options")
      }
      .listRowSeparator(.hidden)
      .listRowBackground(Color.clear)
      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      .listSectionSpacing(.custom(16))
      .listRowSpacing(0)

      Section {
        normalRow(image: "creditcard", text: "**** **** **** 4747")
      } header: {
        normalSectionHeader(title: "Payment method")
      } footer: {
        normalSectionFooter()
      }
      .listRowSeparator(.hidden)
      .listRowBackground(Color.clear)
      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    .listStyle(.insetGrouped)
    .listSectionSeparator(.hidden)
    .background(Color.defaultBackground)
//    .environment(\.defaultMinListRowHeight, 56)
  }

  @ViewBuilder
  func dronRow() -> some View {
    HStack {
      HStack(spacing: 25) {
        Image(systemName: "sun.max.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
          .foregroundStyle(Color.mainPurple)
        Text("By Drone")
          .font(.system(size: 17))
          .foregroundStyle(Color.mainPurple)
      }
      Spacer()
      Image(systemName: "checkmark")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundStyle(Color.mainPurple)
    }
  }

  @ViewBuilder
  func normalRow(image: String, text: String) -> some View {
    HStack(alignment: .top, spacing: 25) {
      Image(systemName: image)
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .foregroundStyle(Color(hex: "2D0C57"))
      Text(text)
        .font(.system(size: 17))
        .foregroundStyle(Color.textSecondary)
    }
  }

  @ViewBuilder
  func normalSectionFooter() -> some View {
    Spacer()
    .frame(height: 16)
  }

  @ViewBuilder
  func normalSectionHeader(title: String) -> some View {
    HStack {
      HStack {
        Text(title)
          .font(.system(size: 22))
          .fontWeight(.bold)
          .foregroundStyle(Color.textPrimary)
        Spacer()
        Text("CHANGE")
          .font(.system(size: 15))
          .fontWeight(.semibold)
          .foregroundStyle(Color.mainPurple)
      }
//      .padding(.horizontal, 20)
    }
    .background(Color.clear)
    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    .frame(height: 56)
  }
}

#Preview {
  CheckoutView()
}
