//
//  SU_Background.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `background()` 中的第一个参数可以是任何实现 `View` 协议的对象, 第二个参数指示第一个参数中所提供视图的对齐方式
 */
struct SU_Background: View {
    var body: some View {
        VStack {
            Text("Hello, World!").background(Color.red)
            Text("")
                .frame(width: 130, height: 100)
                .background(Text("Background"), alignment: .leading)
                .background(Color.green)
            Text("Hello, World")
                .frame(width: 120, height: 100)
                .background(Circle().fill(Color.orange))
        }
    }
}

struct SU_Background_Previews: PreviewProvider {
    static var previews: some View {
        SU_Background()
    }
}
