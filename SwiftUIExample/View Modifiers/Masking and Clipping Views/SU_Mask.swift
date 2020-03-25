//
//  SU_Mask.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func mask<Mask>(_ mask: Mask) -> some View where Mask : View`
 
 使用遵循 `View` 协议的视图 `mask` 作为显示区域应用于视图,其它部分不显示内容
 */
struct SU_Mask: View {
    var body: some View {
        VStack {
            Color(.blue).frame(width: 100, height: 100)
                .mask(Text("Hello, World!").frame(width: 0, height: 0, alignment: .center))
            Image("3")
                .mask(Circle())
        }
    }
}

struct SU_Mask_Previews: PreviewProvider {
    static var previews: some View {
        SU_Mask()
    }
}
