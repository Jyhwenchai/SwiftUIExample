//
//  SU_Saturation.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func saturation(_ amount: Double) -> some View
 `
 调整视图的色彩饱和度，更改色彩饱和度会增加或降低视图中色彩的强度
 */
struct SU_Saturation: View {
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
                .saturation(7)
        }
    }
}

struct SU_Saturation_Previews: PreviewProvider {
    static var previews: some View {
        SU_Saturation()
    }
}
