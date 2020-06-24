//
//  SU_ColorPicker.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # ColorPicker
/// 用于从系统颜色选择器 UI 中选择颜色的控件。
///
/// 拾色器提供了很好的颜色，可以显示当前选择的颜色，并显示允许用户选择新颜色的较大系统的拾色器。 默认情况下，颜色选择器支持不透明的颜色；要禁用不透明度支持，请将 `supportsOpacity` 参数设置为 false。在这种模式下，颜色选择器将不会显示用于调整所选颜色的不透明度的控件，并且会从以编程方式设置或从用户的系统收藏夹中选择的任何颜色中去除不透明度
///
/// 您可以通过将 `ColorPicker` 嵌入视图层次结构中并使用标题字符串和绑定到颜色进行初始化来使用它：
struct SU_ColorPicker: View {
    
    @State private var textColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var body: some View {
        VStack {
            ColorPicker("Alignment Guides", selection: $textColor)
                .foregroundColor(textColor)
            ColorPicker("Alignment Guides", selection: $textColor, supportsOpacity: false)
                .foregroundColor(textColor)
        }

    }
    
}

struct SU_ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        SU_ColorPicker()
    }
}
