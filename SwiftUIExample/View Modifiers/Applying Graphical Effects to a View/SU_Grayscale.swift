//
//  SU_Grayscale.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func grayscale(_ amount: Double) -> some View`
 
 向视图添加灰度效果。要应用的灰度强度，接近0.0的值更显彩色，而接近1.0的值则彩色更少。
 */
struct SU_Grayscale: View {
    var body: some View {
        Image("1")
            .grayscale(0.75)
    }
}

struct SU_Grayscale_Previews: PreviewProvider {
    static var previews: some View {
        SU_Grayscale()
    }
}
