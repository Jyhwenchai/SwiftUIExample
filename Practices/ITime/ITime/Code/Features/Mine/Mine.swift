//
//  Mine.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

struct Mine: View {

  @State private var safeAreaInsets = EdgeInsets()
  let featureLayout = Array(repeating: GridItem(), count: 3)
  let features = MineData.featureItems
  let others = MineData.otherItems

  @State private var path = NavigationPath()

  var body: some View {
    NavigationStack(path: $path) {
      ZStack {
        GeometryReader { proxy in
          Color.clear
            .onAppear {
              safeAreaInsets = proxy.safeAreaInsets
            }
        }
        ScrollView {
          ZStack(alignment: .leading) {
            GeometryReader { proxy in
              let offset = max(proxy.frame(in: .global).origin.y - safeAreaInsets.top, 0)
              Color("medium_blue")
                .frame(height: offset + proxy.size.height)
                .offset(y: -offset)
            }
            HStack {
              AsyncImage(url: nil) { image in

              } placeholder: {
                Image("ic_head64x64")
              }
              Text("未登录")
                .foregroundColor(Color.white)
            }
            .padding(20)
            .padding(.bottom, 10)
          }

          ZStack {
            Color.white
              .cornerRadius(10)
              .offset(y: -10)
            HStack {
              Button {

              } label: {
                VStack {
                  Text("8")
                    .font(.title2)
                  Spacer()
                    .frame(height: 8)
                  Text("时间分类")
                    .font(.subheadline)
                }
                .foregroundColor(Color.black)
              }
              .frame(maxWidth: .infinity)

              Divider()
                .frame(height: 40)

              Button {

              } label: {
                VStack {
                  Text("8")
                    .font(.title2)
                  Spacer()
                    .frame(height: 8)
                  Text("全部待办")
                    .font(.subheadline)
                }
                .foregroundColor(Color.black)
              }
              .frame(maxWidth: .infinity)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
          }

          Color.gray.opacity(0.1)
            .frame(height: 10)


          VStack(alignment: .leading) {
            Text("高级功能")
            LazyVGrid(columns: featureLayout) {
              ForEach(features, id: \.id) { item in
                Button {
                  print(item.text)
                } label: {
                  HStack {
                    Spacer()
                    VStack {
                      ZStack {
                        item.backgroundColor
                          .frame(width: 64, height: 64)
                          .cornerRadius(32)
                        if item.backgroundColor == .clear {
                          Image(item.image)
                            .resizable()
                            .frame(width: 64, height: 64)
                        } else {
                          Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                        }
                      }
                      Text(item.text)
                        .foregroundColor(Color.black)
                    }
                    Spacer()
                  }
                }
                .padding(.vertical, 14)
              }
            }
          }
          .padding(20)

          Color.gray.opacity(0.1)
            .frame(height: 10)

          VStack(alignment: .leading) {
            Text("其它")
            LazyVGrid(columns: featureLayout) {
              ForEach(others, id: \.id) { item in
                Button {
                  print(item.text)
                } label: {
                  HStack {
                    Spacer()
                    VStack {
                      ZStack {
                        item.backgroundColor
                          .frame(width: 64, height: 64)
                          .cornerRadius(32)
                        if item.backgroundColor == .clear {
                          Image(item.image)
                            .resizable()
                            .frame(width: 64, height: 64)
                        } else {
                          Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                        }
                      }
                      Text(item.text)
                        .foregroundColor(Color.black)
                    }
                    Spacer()
                  }
                }
                .padding(.vertical, 14)
              }
            }
          }
          .padding(20)
        }
      }
      .toolbarColorScheme(.dark, for: .navigationBar)
      .navigationTitle("我的")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color("medium_blue"), for: .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
          } label: {
            Image("ic_vip_msg28x28")
          }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            path.append("Settings")
          } label: {
            Image("ic_setting26x26")
          }
          .navigationDestination(for: String.self) { value in
            Settings()
          }
        }
      }
    }
  }
}

struct Mine_Previews: PreviewProvider {
  static var previews: some View {
    Mine()
  }
}

