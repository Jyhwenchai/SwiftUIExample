//
//  SU_ClipShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func clipShape<S>(_ shape: S, style: FillStyle = FillStyle()) -> some View where S : Shape`
 
 可以应用一个遵循 `Shape` 协议的形状对子视图进行裁剪
 */
struct SU_ClipShape: View {
    var body: some View {
        VStack {
            VStack { EmptyView() }
                .frame(width: 150, height: 150)
                .background(Color.orange)
        }
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
}

struct SU_ClipShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_ClipShape()
    }
}
