//
//  SU_ScrollViewReader.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # ScrollViewReader
/// 使用 `ScrollViewReader` 包含列表的视图，这些视图可以通过 `id()` 设置一个标识符，通过 `ScrollViewReader` 中拿到的 `ScrollViewProxy` 可以很容易的滚动到期望的位置。
struct SU_ScrollViewReader: View {
    var body: some View {
        ScrollView() {

            ScrollViewReader(content: { proxy in
                Button("scroll to Row28") {
                    withAnimation { // 通过 `withAnimation()` 可以为滚动添加动画效果
                        proxy.scrollTo(28, anchor: UnitPoint.top)
                    }
                    
                }
                
                ForEach(1..<100) {
                    Text("Row \($0)")
                        .frame(width: 100, height: 30, alignment: .center)
                        .background($0 % 2 == 0 ? Color.orange : Color.purple)
                        .id($0)
                }
            })
        }
        
    }

}

struct SU_ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        SU_ScrollViewReader()
    }
}
