//
//  SU_RotatedShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

// 将 `Shape` 应用旋转变换后的形状。
struct SU_RotatedShape: View {
    var body: some View {
        RotatedShape(shape: Rectangle(), angle: Angle(degrees: 45))
            .fill(Color.blue)
            .frame(width: 200, height: 200)
    }
}

struct SU_RotatedShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_RotatedShape()
    }
}
