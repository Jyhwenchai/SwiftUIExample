//
//  SU_TextEditor.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # TextEditor
/// 可以显示和编辑长格式文本的视图。
///
/// ## Overview
/// 文本编辑视图让你在你的应用用户界面上显示和编辑多行、可滚动的文本。默认情况下，文本编辑器视图使用从环境继承的特征来设置文本的样式，例如 `font（_ :)`， `foregroundColor（_ :)` 和 `multilineTextAlignment（_ :)`。
///
/// 您可以通过将 `TextEditor` 实例添加到视图主体中来创建文本编辑器，并通过将 `Binding` 传递给应用程序中的字符串变量来对其进行初始化

/// 如果你想要修改文本见的间距或者字体缩放比例，你可以使用 `lineLimit(_:)`, `lineSpacing(_:)`, 和 `minimumScaleFactor(_:)` 等方法来进行配置
struct SU_TextEditor: View {
    
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        VStack {
            TextEditor(text: $fullText)
                .lineSpacing(5)
                .foregroundColor(Color.gray)
                .font(.custom("Helvetica Neue", size: 28))
                .frame(width: 336, height: 200, alignment: .leading)
        }
    }
}

struct SU_TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SU_TextEditor()
        }
    }
}
