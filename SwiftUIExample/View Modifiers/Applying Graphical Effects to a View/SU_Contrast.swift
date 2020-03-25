//
//  SU_Contrast.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func contrast(_ amount: Double) -> some View`
 
 设置视图中相似颜色之间的对比度和间隔。
 */
struct SU_Contrast: View {
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
                .contrast(3)
        }
    }
}

struct SU_Contrast_Previews: PreviewProvider {
    static var previews: some View {
        SU_Contrast()
    }
}
