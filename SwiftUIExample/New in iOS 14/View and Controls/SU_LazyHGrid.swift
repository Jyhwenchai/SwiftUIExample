//
//  SU_LazyHGrid.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # LazyHGrid
/// 容器视图，将其子视图排列在水平增长的网格中，仅在需要时创建项目。
///
/// 使用 `GridItem` 描述 `LazyHGrid` 的布局信息
struct SU_LazyHGrid: View {
    var rows: [GridItem] =
        Array(repeating: .init(.fixed(20), spacing: 50, alignment: .center), count: 2)
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                        .font(.footnote)
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct SU_LazyHGrid_Previews: PreviewProvider {
    static var previews: some View {
        SU_LazyHGrid()
    }
}
