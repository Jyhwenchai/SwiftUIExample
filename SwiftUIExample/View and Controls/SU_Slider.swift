//
//  SU_Slider.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Slider: View {
  @State var value: Float = 50
  var body: some View {
    VStack {
      Slider(value: $value, in: 0...100, minimumValueLabel: Text("0"), maximumValueLabel: Text("100")) {
        Text("Slider value: \(value)")
      }


      Slider(value: $value, in: 0...100, onEditingChanged: { state in
        print("Slider 2 value changed" + (state ? " begin" : " end"))
      }) {
        Text("Slider 2 value: \(value)")
      }

      VStack {
        Slider(value: $value, in: 0...100, step: 2) { state in
          print("Slider 3 value changed" + (state ? " begin" : " end"))
        }
        Text("Slider 3 value: \(value)")
      }

    }

  }
}

struct SU_Slider_Previews: PreviewProvider {
  static var previews: some View {
    SU_Slider()
  }
}
