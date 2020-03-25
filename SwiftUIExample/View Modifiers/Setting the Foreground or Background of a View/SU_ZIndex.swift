//
//  SU_ZIndex.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
`zIndex` 可以控制重叠视图的显示顺序。数值越大显示越靠外
 */
struct SU_ZIndex: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.red).frame(width: 100, height: 100).zIndex(1)
            Circle().fill(Color.blue).frame(width: 100, height: 100).offset(x: 40, y: 50).zIndex(0)
            Circle().fill(Color.green).frame(width: 100, height: 100).offset(x: -40, y: 50).zIndex(-1)
        }
    }
}

struct SU_ZIndex_Previews: PreviewProvider {
    static var previews: some View {
        SU_ZIndex()
    }
}
