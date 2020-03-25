//
//  SU_Brighttness.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func brightness(_ amount: Double) -> some View`
 
 调整视图亮度，`amount` 在 0到1之间
 */
struct SU_Brighttness: View {
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
                .brightness(0.5)
        }
    }
}

struct SU_Brighttness_Previews: PreviewProvider {
    static var previews: some View {
        SU_Brighttness()
    }
}
