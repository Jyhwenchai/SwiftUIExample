//
//  SU_LazyVGrid.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # LazyVGrid
/// 容器视图，将其子视图排列在垂直增长的网格中，仅在需要时创建项目。
///
/// 使用 `GridItem` 描述 `LazyVGrid` 的布局信息
struct SU_LazyVGrid: View {
    
    let colors = [Color.red, .blue, .yellow]
    /// 定义网格视图为3列的灵活尺寸布局
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
         ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                 ForEach((0...100), id: \.self) { index in
                    Text("Tab \(index)")
                        .frame(width: 120, height: 150)
                        .background(colors[index % colors.count])
                        .cornerRadius(8)
                 }
             }.font(.largeTitle)
         }
    }
}

struct SU_LazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        SU_LazyVGrid()
    }
}
