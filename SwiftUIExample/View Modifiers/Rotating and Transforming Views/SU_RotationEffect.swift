//
//  SU_RotationEffect.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View`
 对视图应用旋转效果。 `angle` 对应旋转的几何角度，`anchor` 为旋转围绕的点
 
 > `angle` 可以是角度或者一个弧度
 */
struct SU_RotationEffect: View {
    var body: some View {
        
        VStack(spacing: 200) {
            // 应用 Angle 指定旋转角度, 最终旋转30度
            Text("Hello, World!")
            .rotationEffect(Angle(degrees: 30), anchor: .center)
            
            // 应用 Angle 指定旋转弧度，最终旋转45度
            Text("Hello, World!")
                .rotationEffect(Angle(radians: .pi / 4), anchor: .center)
        }
    }
}

struct SU_RotationEffect_Previews: PreviewProvider {
    static var previews: some View {
        SU_RotationEffect()
    }
}
