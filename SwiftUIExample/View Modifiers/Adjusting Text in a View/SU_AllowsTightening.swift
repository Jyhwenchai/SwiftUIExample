//
//  SU_AllowsTightening.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func allowsTightening(_ flag: Bool) -> some View`
 
 设置在必要时文本是否可以压缩字符之间的空格以使文本适合一行。
 */
struct SU_AllowsTightening: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .frame(width: 180, height: 50)
                .background(Color.green)
            Text("Hello, World!")
                .font(.largeTitle)
                .frame(width: 180, height: 50)
                .background(Color.green)
                .allowsTightening(true)
        }
    }
}

struct SU_AllowsTightening_Previews: PreviewProvider {
    static var previews: some View {
        SU_AllowsTightening()
    }
}
