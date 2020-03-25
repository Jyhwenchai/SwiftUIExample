//
//  SU_Offset.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `offset` 将当前视图的位置进行垂直或水平方向的偏移
 */
struct SU_Offset: View {
    var body: some View {
        Text("Hello, World!").offset(x: 100, y: 100).background(Color.red)
    }
}

struct SU_Offset_Previews: PreviewProvider {
    static var previews: some View {
        SU_Offset()
    }
}
