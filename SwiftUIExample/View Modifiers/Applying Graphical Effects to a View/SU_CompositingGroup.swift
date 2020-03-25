//
//  SU_CompositingGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func compositingGroup() -> some View`
 
 将视图包装在一个合成组中。
 
 合成组在此视图的祖先视图中进行合成效果，例如不透明度和混合模式，在此视图呈现之前生效
 */
struct SU_CompositingGroup: View {
    var body: some View {
        ZStack {
            Color(.blue).frame(width: 200, height: 200)
                .blendMode(.hardLight)
            Image("3")
                .blendMode(.hardLight)
            Image("1")
                .blendMode(.hardLight)
        }.compositingGroup()
    }
}

struct SU_CompositingGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_CompositingGroup()
    }
}
