//
//  SU_LineSpacing.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func lineSpacing(_ lineSpacing: CGFloat) -> some View`
 
 调整多行文本的间距
 */
struct SU_LineSpacing: View {
    var body: some View {
        Text("The amount of space between the bottom of one line and the top of the next line")
            .frame(width: 100)
            .lineSpacing(15)
    }
}

struct SU_LineSpacing_Previews: PreviewProvider {
    static var previews: some View {
        SU_LineSpacing()
    }
}
