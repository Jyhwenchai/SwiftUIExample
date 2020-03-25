//
//  SU_TextFieldStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func textFieldStyle<S>(_ style: S) -> some View where S : TextFieldStyle`
 
 目前在 `iOS` 系统中我们只能使用 `SwiftUI` 提供的三种样式
 
 1.DefaultTextFieldStyle （iOS 端默认就是 PlainTextFieldStyle 风格）
 2.PlainTextFieldStyle
 3.RoundedBorderTextFieldStyle
 */
struct SU_TextFieldStyle: View {
    @State var name: String = "Hello, World!"
    var body: some View {
        VStack {
            TextField("please input name", text: $name)
                .textFieldStyle(DefaultTextFieldStyle())
            TextField("please input name", text: $name)
                .textFieldStyle(PlainTextFieldStyle())
            TextField("please input name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct SU_TextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_TextFieldStyle()
    }
}
