//
//  SU_KeyboardType.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func keyboardType(_ type: UIKeyboardType) -> some View`
 
 调整输入键盘的类型
 */
struct SU_KeyboardType: View {
    @State var value = ""
    var body: some View {
        TextField("Hello, World!", text: $value)
            .fixedSize()
            .keyboardType(.numberPad)
    }
}

struct SU_KeyboardType_Previews: PreviewProvider {
    static var previews: some View {
        SU_KeyboardType()
    }
}
