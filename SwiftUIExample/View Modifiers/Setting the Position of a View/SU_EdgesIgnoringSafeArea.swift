//
//  SU_EdgesIgnoringSafeArea.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `safeArea` 作为安全区域将默认为不尺寸的iOS设备提供安全距离，如果要取消这些安全区域带来的影响可以使用 `edgesIgnoringSafeArea`
 */
struct SU_EdgesIgnoringSafeArea: View {
    
    var body: some View {
        List {
            ForEach(0..<100) { _ in
                ZStack {
                    Color(.orange)
                    Text("Hello, World")
                }.listRowInsets(EdgeInsets())
            }
        }
        .edgesIgnoringSafeArea(.all)// iOS 15 中废弃
    }
}

struct SU_EdgesIgnoringSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        SU_EdgesIgnoringSafeArea()
    }
}
