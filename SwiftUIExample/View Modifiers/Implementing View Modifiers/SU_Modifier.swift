//
//  SU_Modifier.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T>`
 
 可以应用一个自定义的修改器到视图中
 */
struct SU_Modifier: View {
    var body: some View {
        Text("Hello, World!")
            .modifier(CustomModifier())
    }
}

struct SU_Modifier_Previews: PreviewProvider {
    static var previews: some View {
        SU_Modifier()
    }
}

// 自定义修改器
struct CustomModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.green)
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(15)
    }
}
