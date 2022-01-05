//
//  SU_ToolBarItem.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/12/29.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

// 表示用于 toolbar 或 navigationBar 上显示 item 的模型
struct SU_ToolBarItem: View {
    var body: some View {
        TabView {
            NavigationView {
                Text("Page One")
                .navigationTitle("List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) { Image(systemName: "gear") }
                    }
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {}) { Image(systemName: "book") }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {}) { Image(systemName: "car.circle.fill") }
                    }
                }
            }
        }
    }
}

struct SU_ToolBarItem_Previews: PreviewProvider {
    static var previews: some View {
        SU_ToolBarItem()
    }
}
