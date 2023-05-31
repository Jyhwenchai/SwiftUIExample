//
//  Test.swift
//  ITime
//
//  Created by 蔡志文 on 5/25/23.
//

import SwiftUI

struct Test: View {
  @State private var safeAreaInsets = EdgeInsets()
  let featureLayout = Array(repeating: GridItem(), count: 3)
  let features = MineData.featureItems

  var body: some View {
    NavigationStack {
      ZStack {
        GeometryReader { proxy in
          Color.clear
            .onAppear {
              safeAreaInsets = proxy.safeAreaInsets
            }
        }
        List {
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
          .listRowSeparator(.hidden)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          .listRowBackground(Color.clear)

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
              }
              .frame(maxWidth: .infinity)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
          }
          .listRowSeparator(.hidden)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          .listRowBackground(Color.clear)

          Color.gray.opacity(0.1)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .frame(height: 10)


          VStack(alignment: .leading) {
            Text("高级功能")
            LazyVGrid(columns: featureLayout) {
              ForEach(features, id: \.id) { item in
                Button {
                  print(item.text)
                } label: {
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
                  }
                }
                .padding(.vertical, 14)
              }
            }
            .background(Color.orange)
          }
          .listRowSeparator(.hidden)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          .padding(20)
          .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 10)
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

          } label: {
            Image("ic_setting26x26")
          }
        }
      }
    }
  }
}

struct Test_Previews: PreviewProvider {
  static var previews: some View {
    Test()
  }
}
