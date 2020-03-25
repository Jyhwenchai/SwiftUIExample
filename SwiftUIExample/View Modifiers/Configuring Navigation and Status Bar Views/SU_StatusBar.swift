//
//  SU_StatusBar.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 隐藏状态栏，可以在真机上运行查看效果
 */

struct SU_StatusBar: View {
    var body: some View {
        Text("Hello, World!")
            .statusBar(hidden: true)
    }
}

struct SU_StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        SU_StatusBar()
    }
}
