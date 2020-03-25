//
//  SU_ForegroundColor.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 设置视图的前景色，如果可以设置的话
 */
struct SU_ForegroundColor: View {
    @State var state: Bool = true
    @State var value: Float = 50
    var body: some View {
        VStack {
            Text("Hello, World!").foregroundColor(Color.red)
            
            Button(action: {}) {
                Text("Button")
            }
            .foregroundColor(Color.green)
            .padding()
            
            Toggle(isOn: $state) {
                Text("Toggle")
            }
            .foregroundColor(Color.blue)
            .fixedSize()
            
            Slider(value: $value, in: 0...100, minimumValueLabel: Text("0"), maximumValueLabel: Text("100")) {
                Text("currentValue \(value)")
            }
            .foregroundColor(Color.orange)
            .padding()
        }
    }
}

struct SU_ForegroundColor_Previews: PreviewProvider {
    static var previews: some View {
        SU_ForegroundColor()
    }
}
