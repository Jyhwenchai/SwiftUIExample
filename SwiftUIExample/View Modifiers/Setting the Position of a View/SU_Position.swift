//
//  SU_Position.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 position 表示视图的中心点位置
 如果你设置 x 为 0，那么视图的一半将在屏幕外
 */
struct SU_Position: View {
    var body: some View {
        VStack {
            Text("Hello, World!").position(CGPoint(x: 0, y: 50))
                .background(Color.red)
            Text("Hello, World!").position(x: 150, y: 100)
                .background(Color.yellow)
        }
        
    }
}

struct SU_Position_Previews: PreviewProvider {
    static var previews: some View {
        SU_Position()
    }
}
