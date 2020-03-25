//
//  SU_ButtonStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func buttonStyle<S>(_ style: S) -> some View where S : PrimitiveButtonStyle`
 
 可以使用此方法修改 `Button` 的风格
 
 `func buttonStyle<S>(_ style: S) -> some View where S : ButtonStyle`
 
 可以使用此方法自定义 `Button` 的样式。其中自定义的 `style` 需要遵循 `ButtonStyle` 协议
 */
struct SU_ButtonStyle: View {
    var body: some View {
        VStack(spacing: 15) {
            Button(action: {}) { Text("Button") }
            
            Button(action: {}) { Text("Button") }
                .buttonStyle(PlainButtonStyle())
            
            Button(action: {}) { Text("") }
                .buttonStyle(CustomButtonStyle())
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        Spacer()
            .frame(width: 40, height: 6)
            .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
            .cornerRadius(3)
            .frame(width: 60, height: 60)
            .background(Color.green)
            .cornerRadius(30)
            .frame(width: 70, height: 70)
            .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            .cornerRadius(35)
    }

}

struct SU_ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_ButtonStyle()
    }
}
