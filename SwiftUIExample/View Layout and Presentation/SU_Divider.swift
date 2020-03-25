//
//  SU_Divider.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 Divider
 
产生一条分割线，用与分隔视图控件间的分隔
 */
struct SU_Divider: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Divider()
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
}

struct SU_Divider_Previews: PreviewProvider {
    static var previews: some View {
        SU_Divider()
    }
}
