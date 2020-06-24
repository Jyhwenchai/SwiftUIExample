//
//  SU_LazyHStack.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # LazyHStack
/// 一种视图，将其子级排列在水平增长的线中，仅在需要时创建项目。
///
/// ## Overview
/// 堆栈是“惰性”的，因为堆栈视图在需要将它们呈现在屏幕上之前不会创建项目。

struct SU_LazyHStack: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                        .frame(width: 100, height: 300, alignment: .center)
                        .background(Color.orange)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct SU_LazyHStack_Previews: PreviewProvider {
    static var previews: some View {
        SU_LazyHStack()
    }
}
