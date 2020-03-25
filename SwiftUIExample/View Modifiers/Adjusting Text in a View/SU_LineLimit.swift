//
//  SU_LineLimit.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func lineLimit(_ number: Int?) -> some View`
 
 设置文本可以在视图中占据的最大行数。`number` 大于等于1，如果不设置则全部显示。
 */
struct SU_LineLimit: View {
    @State var value = ""
    var body: some View {
        Text("The line limit applies to all Text instances within this view. For example, an HStack with multiple pieces of text longer than three lines caps each piece of text to three lines rather than capping the total number of lines across the HStack.")
        .lineLimit(2)
    }
}

struct SU_LineLimit_Previews: PreviewProvider {
    static var previews: some View {
        SU_LineLimit()
    }
}
