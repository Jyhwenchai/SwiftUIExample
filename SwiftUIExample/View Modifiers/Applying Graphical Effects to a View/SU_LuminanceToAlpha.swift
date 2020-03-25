//
//  SU_LuminanceToAlpha.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func luminanceToAlpha() -> some View`
 
 向视图的 alpha 效果添加亮度。
 
 修改器会在视图之外创建一个半透明的蒙版。蒙版使视图中的暗区变为透明，亮区变为不透明的黑色。中等亮度区域变为部分不透明的灰色
 */
struct SU_LuminanceToAlpha: View {
    var body: some View {
        VStack(spacing: 50) {
            Image("flower")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:300, height: 220)
            Image("flower")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:300, height: 220)
                .luminanceToAlpha()
        }
    }
}

struct SU_LuminanceToAlpha_Previews: PreviewProvider {
    static var previews: some View {
        SU_LuminanceToAlpha()
    }
}
