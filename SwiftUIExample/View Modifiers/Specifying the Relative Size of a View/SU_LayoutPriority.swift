//
//  SU_LayoutPriority.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 类似于 AutoLayout 中的约束优先级，优先级越高在有限的空间内所能占据的布局范围越大，反之优先级小的布局空间可能被压缩
 */
struct SU_LayoutPriority: View {
    
    // 修改各 View 的 layoutPriority 对比效果
    var leftViewLayoutPriority: Double = -1
    var centerViewLayoutPriority: Double = 0
    var rightViewLayoutPriority: Double = 1
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!") // 修改 width 观察效果
                    .background(Color.blue)
                    .layoutPriority(leftViewLayoutPriority)
                Text("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!")
                    .background(Color.red)
                    .layoutPriority(centerViewLayoutPriority)
                Text("Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!") // 修改 width 观察效果
                    .background(Color.green)
                    .layoutPriority(rightViewLayoutPriority)
            }
            .frame(width: 300, height: 100, alignment: .center)
            .background(Color.yellow)

        }
    }
    
}

struct SU_LayoutPriority_Previews: PreviewProvider {
    static var previews: some View {
        SU_LayoutPriority()
    }
}
