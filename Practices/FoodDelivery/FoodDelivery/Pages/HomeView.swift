//
//  HomeView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/3/24.
//

import SwiftUI

struct HomeView: View {
  @State private var selectTag = HomeData.Tab.category
  var body: some View {
    TabView(selection: $selectTag) {
      CategoryView()
        .tabItem {
          Image(selectTag == .category ? .tabGridSelected : .tabGridNormal)
        }
        .tag(HomeData.Tab.category)
        .toolbarBackground(.myTabItemStyle, for: .tabBar)
      VegetableView()
        .tabItem {
          Image(selectTag == .vegetable ? .tabShoppingCartSelected : .tabShoppingCartNormal)
        }
        .tag(HomeData.Tab.vegetable)
      MineView()
        .tabItem {
          Image(selectTag == .category ? .tabUserNormal : .tabUserNormal)
        }
        .tag(HomeData.Tab.mine)
    }
    .overlay {
      VStack {
        Spacer()
      }
    }

  }
}

struct MyTabItemShapeStyle: ShapeStyle {
  func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
    Color.white
  }
}

extension ShapeStyle where Self == MyTabItemShapeStyle {
  static var myTabItemStyle: Self { Self.init() }
}

#Preview {
  HomeView()
}
