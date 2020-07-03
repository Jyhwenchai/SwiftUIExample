//
//  SU_Binding.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/2.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `@Binding`
/// 在传统方式中，父视图中传递属性给子视图使子视图初始化当前状态，但是当子视图的状态发生变化时我们无法通过属性自动的同步到父视图，我们需要使用代理或者闭包的收到才能通知父视图子视图状态的变化以及时更新父视图的状态。
///
/// 在 SwiftUI 中我们对子视图使用 `@Binding` ，它可以使父视图的状态与子视图进行双向同步，当子视图中 `@Binding` 修饰的属性值发生更新时，父视图对应 `@State` 的属性将同步更新值，同时对应视图布局也将进行相应的更新，这样就保证了父子视图的状态都保持在正确的结果
/// ![Managing User Interface State](https://docs-assets.developer.apple.com/published/d98251c2fac9fc4f6843be1e4836cb93/110/SwiftUI-MUIS-Overview@2x.png)
struct SU_Binding: View {
    
    @State var message: String = "hello, world"
    
    var body: some View {
        VStack {
            Text(message)
            // 将 `message` 与 BindingTextView 中的 `text` 属性进行绑定
            BindingTextView(text: $message)
        }
    }
}

struct BindingTextView: View {
    
    @Binding var text: String
    
    /// 当输入的内容发生变化后，将同步 `text` 属性的值，同时父视图中的 `message` 的值也将同步更新
    var body: some View {
        VStack {
            TextField("input... ", text: $text)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 40, alignment: .center)
                .border(Color.red, width: 2)
        }
    }
}

struct SU_Binding_Previews: PreviewProvider {
    static var previews: some View {
        SU_Binding()
    }
}
