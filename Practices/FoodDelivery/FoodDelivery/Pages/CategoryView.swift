//
//  CategoryView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/3/24.
//

import SwiftUI

struct CategoryView: View {
  @State private var searchText = ""
  @State private var isPresented = false
  let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
  var body: some View {
    NavigationStack {
      ScrollView {
//        TextField("Input", text: $searchText)
//          .frame(width: .infinity, height: 56)
//          .background(Color.orange)
//          .padding(.horizontal, 20)
        LazyVGrid(columns: columns, spacing: 20, content: {
          ForEach(0..<20) { _ in
            NavigationLink {
              VegetableView()
            } label: {
              CategoryItem()
            }
          }
        })
        .padding(.horizontal, 20)
      }
      .navigationTitle("Category")
    }
    .searchable(text: $searchText, prompt: "Looking for something") {
      ForEach(0..<10) { index in
        Text("Search Result: \(index)")
      }
    }
//    .searchable(text: $searchText, isPresented: $isPresented, prompt: "Looking for something")
//    .sheet(isPresented: $isPresented, content: {
//      ForEach(0..<10) { index in
//        Text("Search Result: \(index)")
//      }
//    })
  }

  @ViewBuilder
  func CategoryItem() -> some View {
    VStack {
      Image(.img1)
        .resizable()
        .scaledToFill()
        .frame(height: 140)
        .clipped()

      HStack(alignment: .top) {
        VStack(alignment: .leading, spacing: 10) {
          Text("Vegetable")
            .font(.system(size: 18))
            .fontWeight(.bold)
            .tint(Color.textPrimary)
          Text("(43)")
            .font(.system(size: 12))
            .tint(Color.textSecondary)
        }
        Spacer()
      }
      .padding(.leading, 16)
      .padding(.bottom, 17)
    }
    .clipShape(.rect(cornerRadius: 8))
    .overlay {
      RoundedRectangle(cornerRadius: 8)
        .stroke(Color(hex: "d9d0e3"), lineWidth: 1)
    }
  }
}

#Preview {
  CategoryView()
    .background(Color.clear)
}
