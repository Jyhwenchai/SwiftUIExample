//
//  SU_ViewBuilder.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `ViewBuilder`
 
 文档中对 `ViewBuilder` 的解释是：一个自定义参数属性，用于从闭包构造视图。
 简单的说就是 `ViewBuilder` 允许我们在一个闭包中返回多个视图，点开该类文档查看其方法可以看到其最多支持在闭包返回 10 个视图。
 
 看下 `VStack` 的构造方法
 `@inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)`
 
 最后的闭包由 `@ViewBuilder` 标记了 `content`，所以我们可以在 `VStack` 包含一些视图，但正如前面说的起做多只能放置10个视图，所以当超过10个时，我们需要用其它的视图进行包裹，否则编译无法通过。
 ``
 */
struct SU_ViewBuilder: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!")
            
            Text("Hello, World!")
            Text("Hello, World!")
            
            Text("Hello, World!")
            Text("Hello, World!")
            
            Text("Hello, World!")
            Text("Hello, World!")
            
            Text("Hello, World!")
            Text("Hello, World!")
            
            // 打开注释则编译无法通过
//            Text("Hello, World!")
        }
    }
}

struct SU_ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        SU_ViewBuilder()
    }
}
