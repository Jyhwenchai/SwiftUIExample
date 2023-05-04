//
//  Test.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 4/18/23.
//  Copyright © 2023 蔡志文. All rights reserved.
//

import SwiftUI

struct Test: View {
  var body: some View {
    VStack {
      CustomView()
        .frame(width: 100)
      CustomView()
        .frame(width: 50)
      CustomView()
        .frame(width: 150)
    }
  }

  @ViewBuilder
  func CustomView() -> some View {
    ViewThatFits(in: .horizontal) {
      HStack {
        Rectangle()
          .frame(width: 100, height: 10)
        Text("Bar")
      }
      Rectangle()
        .frame(width: 80, height: 10)
      Text("Bar")
    }
  }

}

struct Test_Previews: PreviewProvider {

  static var previews: some View {
    Test()
  }
}
