//
//  SU_ViewModifier.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 通过实现 `ViewModifier` 协议我们可以自定义自己的视图修改器
 */
struct SU_ViewModifier: View {
    var body: some View {
        Text("Hello, World!")
            .font(.system(size: 28))
            .fontWeight(.bold)
            .modifier(TextModifier())
    }
}

struct SU_ViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        SU_ViewModifier()
    }
}

// 自定义修改器
struct TextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.green)
            .padding(.horizontal, 5)
            .overlay(
                Color.red
                    .frame(height: 4)
                    .cornerRadius(2)
            )
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(15)
    }
}
