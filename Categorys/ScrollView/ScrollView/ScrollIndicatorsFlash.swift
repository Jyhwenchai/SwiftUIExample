//
//  ScrollIndicatorsFlash.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

struct ScrollIndicatorsFlash: View {
  @State var changedValue: Int = 0
  var body: some View {
    TabView {
      ScrollView {
        VStack {
          ForEach(0..<40, id: \.self) { item in
            Text("item \(item)")
          }
        }
      }
      .tabItem { Text("ScrollIndicatorsFlash") }
      // 在视图出现的时候会显示一下指示器
      .scrollIndicatorsFlash(onAppear: true)

      ScrollView {
        VStack {
          ForEach(0..<40, id: \.self) { item in
            Text("item \(item)")
          }
        }
      }
      // 给定一个值，当这个值发生改变时会触发指示器的显示
      .scrollIndicatorsFlash(trigger: changedValue)
      .containerRelativeFrame(.horizontal)
      .overlay {
        Button("change value: \(changedValue)") {
          changedValue = Int.random(in: 0...1000)
        }
        .padding()
        .background(Color.white)
      }
      .tabItem { Text("ScrollIndicatorsFlashTrigger") }
    }
  }
}

#Preview {
  ScrollIndicatorsFlash()
}
