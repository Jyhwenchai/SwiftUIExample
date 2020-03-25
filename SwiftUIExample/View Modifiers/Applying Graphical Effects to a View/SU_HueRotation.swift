//
//  SU_HueRotation.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func hueRotation(_ angle: Angle) -> some View`
 将色调旋转效果应用于视图
 */
struct SU_HueRotation: View {
    var body: some View {
        VStack(spacing: 50) {
            Image("flower")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:300, height: 220)
            Image("flower")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:300, height: 220)
                .hueRotation(.degrees(45))
        }
    }
}

struct SU_HueRotation_Previews: PreviewProvider {
    static var previews: some View {
        SU_HueRotation()
    }
}
