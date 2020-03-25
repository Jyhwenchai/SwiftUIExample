//
//  SU_Clipped.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func clipped(antialiased: Bool = false) -> some View`
 默认情况下如果子视图的 `frame` 超出父视图的 `frame` 超出部分仍然可见，那么使用此修改器可以裁剪掉超出部分。`antialiased` 指示是否应用平滑应用于剪切部分的边缘.
 
 > 暂时还不清楚 `antialiased` 的应用场景
 */
struct SU_Clipped: View {
    var body: some View {
        ZStack {
            VStack { EmptyView() }
                .frame(width: 200, height: 200)
                .background(Color.orange)
        }
        .frame(width: 150, height: 150)
        .background(Color.primary)
        .clipped(antialiased: false)
    }
}

struct SU_Clipped_Previews: PreviewProvider {
    static var previews: some View {
        SU_Clipped()
    }
}
