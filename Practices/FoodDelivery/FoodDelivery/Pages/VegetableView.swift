//
//  VegetableView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/3/24.
//

import SwiftUI

struct VegetableView: View {
  @Environment(\.dismiss) var dismiss

  @State private var searchText = ""
  let gridItems = [
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10),
    GridItem(.flexible(), spacing: 10)
  ]

  var body: some View {
    List {
      ScrollView(.horizontal) {
//        LazyHGrid(rows: gridItems, spacing: 10, content: {
//          ForEach(0..<20) { index in
//            Text("tag \(index)")
//              .font(.system(size: 14))
//              .foregroundStyle(Color.textSecondary)
//              .padding(.horizontal, 20)
//              .padding(.vertical, 10)
//              .background(Color.white)
//              .clipShape(Capsule())
//          }
//        })
//        LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10, content: {
//          ForEach(0..<20) { index in
//            Text("tag \(index)")
//              .font(.system(size: 14))
//              .foregroundStyle(Color.textSecondary)
//              .padding(.horizontal, 20)
//              .padding(.vertical, 10)
//              .background(Color.white)
//              .clipShape(Capsule())
//          }
//        })
        Grid(alignment: .center, horizontalSpacing: 10, verticalSpacing: 10) {
          GridRow(alignment: .center) {
            ForEach(0..<3) { index in
              Text("tag \(index)")
                .font(.system(size: 14))
                .foregroundStyle(Color.textSecondary)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .clipShape(Capsule())
            }
          }
          GridRow(alignment: .center) {
            ForEach(0..<20) { index in
              Text("tag \(index)")
                .font(.system(size: 14))
                .foregroundStyle(Color.textSecondary)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .clipShape(Capsule())
            }
          }
        }
      }
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)

      ForEach(0..<20) { _ in
        VegetableItem()
          .listRowSeparator(.hidden)
          .listRowInsets(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
      }
    }
    .background(Color.defaultBackground)
    .navigationTitle("Vegetable")
    .searchable(text: $searchText)
    .listStyle(.plain)
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button(action: {
          dismiss()
        }, label: {
          Image(systemName: "chevron.backward")
            .resizable()
            .scaledToFit()
            .frame(width: 12)
            .foregroundStyle(Color.textPrimary)
        })
      }
    }
  }


  @ViewBuilder
  func VegetableItem() -> some View {
    HStack(spacing: 0) {
      Image(.img2)
        .resizable()
        .scaledToFill()
        .frame(height: 128)
        .frame(maxWidth: .infinity)
        .clipShape(.rect(cornerRadius: 8))

      Spacer()
        .frame(width: 20)

      VStack(alignment: .leading, spacing: 0) {
        VStack(spacing: 12) {
          Text("Boston Lettuce")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .foregroundStyle(Color.textPrimary)
          HStack {
            Text("1.10")
              .font(.system(size: 22))
              .fontWeight(.bold)
              .foregroundStyle(Color.textPrimary)
            Text("€ / piece")
              .font(.system(size: 16))
              .foregroundStyle(Color.textSecondary)
          }
        }

        Spacer()
          .layoutPriority(2)

        HStack(spacing: 20) {
          Button(action: {}, label: {
            Image(systemName: "heart")
              .resizable()
              .frame(width: 20, height: 20)
          })
          .frame(width: 78, height: 40)
          .background(.white)
          .clipShape(.rect(cornerRadius: 8))
          .overlay {
            RoundedRectangle(cornerRadius: 8)
              .stroke(.border, lineWidth: 1.0)
          }

          Button(action: {}, label: {
            Image(systemName: "cart")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundStyle(.white)
          })
          .frame(width: 78, height: 40)
          .background(.primaryButton)
          .clipShape(.rect(cornerRadius: 8))
        }
      }
      .frame(height: 128)
      .frame(maxWidth: .infinity)
    }
    .padding(.vertical, 0)
    .listRowBackground(Color.clear)
  }
}

#Preview {
    VegetableView()
}
