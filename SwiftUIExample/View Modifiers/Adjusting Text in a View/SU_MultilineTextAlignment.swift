//
//  SU_MultilineTextAlignment.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func multilineTextAlignment(_ alignment: TextAlignment) -> some View`
 
 为文本应用在视图中的对齐方式
 */
struct SU_MultilineTextAlignment: View {
    var body: some View {
        Text("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
            .multilineTextAlignment(.center)
    }
}

struct SU_MultilineTextAlignment_Previews: PreviewProvider {
    static var previews: some View {
        SU_MultilineTextAlignment()
    }
}
