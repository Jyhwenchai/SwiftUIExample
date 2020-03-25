//
//  SU_Font.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func font(_ font: Font?) -> some View`
 调整字体
 */
struct SU_Font: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
            Text("Hello, World!")
                .font(Font.custom("Ping Fang SC", size: 33))
            Text("Hello, World!")
                .font(Font.custom("verdana", size: 33))
        }
    }
}

struct SU_Font_Previews: PreviewProvider {
    static var previews: some View {
        SU_Font()
    }
}
