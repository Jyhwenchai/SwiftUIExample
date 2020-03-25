//
//  SU_AccentColor.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_AccentColor: View {
    @State var state: Bool = true
    @State var value: Float = 50
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Button")
            }
            .accentColor(Color.green)
            .padding()
            
            Slider(value: $value, in: 0...100, minimumValueLabel: Text("0"), maximumValueLabel: Text("100")) {
                Text("currentValue \(value)")
            }
            .accentColor(Color.orange)
            .padding()
        }
    }
}

struct SU_AccentColor_Previews: PreviewProvider {
    static var previews: some View {
        SU_AccentColor()
    }
}
