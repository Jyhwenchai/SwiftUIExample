//
//  SU_State.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/2.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `@State`
/// 一个属性包装器类型，可以读取和写入由 SwiftUI 管理的值。
///
/// 使用 `@State` 可以将属性与视图的状态进行绑定，当属性方式变化后相关联视图的状态也将同步的更新

struct SU_State: View {
    
    @State var selected: Bool = false
    
    var body: some View {
        Button( selected ? "Selected" : "UnSelected") {
            selected.toggle()
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.orange)
    }
}

struct SU_State_Previews: PreviewProvider {
    static var previews: some View {
        SU_State()
    }
}
