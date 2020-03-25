//
//  SU_RenderingMode.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image`
 
 设置图片的渲染模式，指定为 `original` 后将保持图片自身的颜色，使用 `template` 将可以调整图片的颜色为我们所指定的
 */
struct SU_RenderingMode: View {
    var body: some View {
        VStack {
            Image(systemName: "message")
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
            
            Image(systemName: "message")
                .renderingMode(.template)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
        }
    }
}

struct SU_RenderingMode_Previews: PreviewProvider {
    static var previews: some View {
        SU_RenderingMode()
    }
}
