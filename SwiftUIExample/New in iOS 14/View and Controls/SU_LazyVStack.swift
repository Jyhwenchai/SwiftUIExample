//
//  SU_LazyVStack.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # LazyVStack
/// 将子项排列在垂直方向上的视图，仅在需要时创建项目
///
/// ## Overview
/// 堆栈是“惰性”的，因为堆栈视图在需要将它们呈现在屏幕上之前不会创建项目。

struct SU_LazyVStack: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                        .frame(width: 100, height: 30, alignment: .center)
                        .background($0 % 2 == 0 ? Color.orange : Color.purple)
                }
            }
        }
    }
}

struct SU_LazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        SU_LazyVStack()
    }
}
