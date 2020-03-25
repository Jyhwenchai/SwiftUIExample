//
//  SU_Rotation3DEffect.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func rotation3DEffect(_ angle: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View`
 
 为视图应用3D旋转，其中
 `angle` 为旋转的几何角度，
 `axis` 对应旋转的轴，取值在-1到1之间，-1表示反方向旋转，0则不进行旋转，1为正方向旋转。
 `anchorZ` 为 Z 轴视觉距离，值越高视距就越远.
 `perspective` 为放大的比例，默认为1
 
 */
struct SU_Rotation3DEffect: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .foregroundColor(.yellow)
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0),anchorZ: -60, perspective: 1)
    }
}

struct SU_Rotation3DEffect_Previews: PreviewProvider {
    static var previews: some View {
        SU_Rotation3DEffect()
    }
}
