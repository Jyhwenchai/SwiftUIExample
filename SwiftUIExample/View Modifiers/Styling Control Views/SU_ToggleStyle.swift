//
//  SU_ToggleStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
`func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle`

目前在 `iOS` 系统中我们只能使用 `SwiftUI` 提供的两种样式

1.DefaultToggleStyle （iOS 端默认就是 SwitchToggleStyle 风格）
2.SwitchToggleStyle
 
也可以通过遵守 `ToggleStyle` 自定义样式，见示例
*/
struct SU_ToggleStyle: View {
    @State var open = false
    var body: some View {
        VStack {
            Toggle(isOn: $open) { Text(open ? "open" : "close") }.fixedSize()
            Toggle(isOn: $open) { Text(open ? "open" : "close") }.fixedSize()
                .toggleStyle(SwitchToggleStyle())
            Toggle(isOn: $open) { Text(open ? "open" : "close") }.fixedSize()
                .toggleStyle(CustomToggleStyle())
        }
    }
}

struct SU_ToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_ToggleStyle()
    }
}


struct CustomToggleStyle: ToggleStyle {
   
    func makeBody(configuration: Self.Configuration) -> some View {
        
        Button(action: { configuration.isOn.toggle() }) {
            if configuration.isOn {
                ZStack {
                    Circle()
                        .fill(Color(#colorLiteral(red: 1, green: 0.394016559, blue: 0.08015117532, alpha: 1)))
                        .frame(width: 25, height: 25)
                    Circle()
                        .stroke(AngularGradient(gradient: Gradient(colors: [Color.red, Color.green, Color.blue]), center: .center), lineWidth: 5)
                        .frame(width: 50, height: 50)
                }
                
                
            } else {
                ZStack {
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .frame(width: 25, height: 25)
                    Circle()
                        .stroke(Color.gray, lineWidth: 5)
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}
