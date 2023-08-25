//
//  ContentView.swift
//  TipKitEG
//
//  Created by 蔡志文 on 8/8/23.
//

import SwiftUI
import TipKit

struct ContentView: View {
  private var favouriteTip = FavoriteTip()
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("iJustine") {
          VStack {

          }
          .navigationTitle("iJustine")
          .onAppear(perform: {
            //  当页面打开时更新次数
            FavoriteTip.numberOfTimesVisited.donate()
          })
          .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
              Button(action: {
//                FavoriteTip.showTip = true
              }) {
                Image(systemName: "star")
              }
              .popoverTip(favouriteTip, arrowEdge: .top)
            }
          }
        }

      }
      .navigationTitle("Messages")
//      .toolbar {
//        ToolbarItem(placement: .topBarTrailing) {
//          Button(action: {
//            FavoriteTip.showTip = true
//          }) {
//            Image(systemName: "star")
//          }
//          .popoverTip(favouriteTip, arrowEdge: .top)
//        }
//      }
    }
  }
}

struct FavoriteTip: Tip {
  @Parameter
  static var showTip: Bool = false
  static var numberOfTimesVisited: Event = Event(id: "com.abcdefg.ilosic")

  var title: Text {
    Text("Move Contact to Favourites")
  }

  var message: Text? {
    Text("Frequently opened Chats can be moved to favourites for ease of access!")
  }

  var asset: Image? {
    Image(systemName: "star")
  }

  var options: [TipOption] {
    return [
      Tips.MaxDisplayCount(3)
    ]
  }

  var rules: [Rule] {
    return [
//      #Rule(Self.$showTip) { $0 == true }
      // 修改规则大于3次后才出现
      #Rule(Self.numberOfTimesVisited) { $0.donations.count > 3 }
    ]
  }
}

#Preview {
  ContentView()
}
