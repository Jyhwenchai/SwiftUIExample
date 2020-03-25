//
//  SU_BlendMode.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func blendMode(_ blendMode: BlendMode) -> some View`
 
 设置用于将视图与重叠视图进行合成的混合模式。
 */
struct SU_BlendMode: View {
    var body: some View {
        ZStack {
            Color(.blue).frame(width: 200, height: 200)
                .blendMode(.hardLight)
            Image("3")
                .blendMode(.hardLight)
            Image("1")
                .blendMode(.hardLight)
        }
    }
}

struct SU_BlendMode_Previews: PreviewProvider {
    static var previews: some View {
        SU_BlendMode()
    }
}
