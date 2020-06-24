//
//  SU_TabStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # TabStyle
/// 对 `TabView` 新增的风格支持，使用 `tabViewStyle()` 修改器设置
struct SU_TabStyle: View {
    let colors = [Color.red, .yellow, .blue]
    
    var body: some View {
        TabView {
            ForEach(0..<6) { index in
                Text("Tab \(index)")
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(colors[index % colors.count])
                    .cornerRadius(8)
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct SU_TabStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_TabStyle()
    }
}
