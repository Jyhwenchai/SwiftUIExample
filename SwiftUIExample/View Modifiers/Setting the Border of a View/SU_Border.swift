//
//  SU_Border.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle`
 
 定义了视图边框的风格，其中填充边框的内容 `content` 可以是符合 `ShapeStyle` 协议实例
 */
struct SU_Border: View {
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                EmptyView()
            }
            .frame(width: 100, height: 100)
            .border(Color.black, width: 5)
            
            VStack {
                EmptyView()
            }
            .frame(width: 100, height: 100)
            .border(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing), width: 20)
        }
            
    }
}

struct SU_Border_Previews: PreviewProvider {
    static var previews: some View {
        SU_Border()
    }
}
