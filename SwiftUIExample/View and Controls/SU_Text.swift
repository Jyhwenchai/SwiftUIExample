//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/10.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Text: View {
    var body: some View {
        Text("Hello, World! Hello, World!")
            .font(.system(size: 25))
            .bold()
            // 设置此视图中的文本是否在必要时可以压缩字符之间的空格以使文本适合一行。
            .allowsTightening(true)
            // 设置文本缩小以适合可用空间的最小数量。
            .lineLimit(2)
            .lineSpacing(10)
            .minimumScaleFactor(0.9)
            .foregroundColor(Color.red)
            .frame(width: 200, height: 200)
            .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SU_Text()
    }
}
