//
//  SU_OutlineGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # OutlineGroup
/// 树结构的视图表示方式
///
/// ## 参数
/// 五个通用类型约束定义一个特定的OutlineGroup实例：
///     * Data：包含树形数据中元素子元素的集合的类型。
///     * ID：元素标识符的类型。
///     * Parent：子元素属性为非 null 的元素的视觉表示类型。
///     * Leaf：子元素属性为 nil 的元素的视觉表示类型。
///     *  SubGroup：一种视图类型，将一个父视图和一个代表其子视图的视图分组，通常具有一些用于显示和隐藏子视图的机制
struct SU_OutlineGroup: View {
    let data =
        FileItem(name: "users", children:
                    [FileItem(name: "user1234", children:
                                [FileItem(name:"Photos", children:
                                            [FileItem(name: "photo001.jpg"),
                                             FileItem(name: "photo002.jpg")]),
                                 FileItem(name:"Movies", children:
                                            [FileItem(name: "movie001.mp4")]),
                                 FileItem(name:"Documents", children: [])
                                ]),
                     FileItem(name: "newuser", children:
                                [FileItem (name: "Documents", children: [])
                                ])
                    ])
    var body: some View {
        OutlineGroup(data, children: \.children) { item in
            Text ("\(item.description)")
        }
        .padding(.all, 20)
    }
}

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch (children) {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.count > 0 ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

struct SU_OutlineGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_OutlineGroup()
    }
}
