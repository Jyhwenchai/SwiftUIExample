//
//  SU_ToolBarItemGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/12/29.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

// 消除了显示使用多个 ToolbarItem 的使用
struct SU_ToolBarItemGroup: View {
    var body: some View {
        NavigationView {
            Text("Hello, SwiftUI")
            .navigationTitle("List")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) { Image(systemName: "gear") }
                    Button(action: {}) { Image(systemName: "book") }
                }
            }
            // 与下面写法等价
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) { Image(systemName: "gear") }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) { Image(systemName: "book") }
                }
            }
        }
    }
}

struct SU_ToolBarItemGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_ToolBarItemGroup()
    }
}
