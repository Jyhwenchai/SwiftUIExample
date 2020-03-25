//
//  SU_ColorInvert.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func colorInvert() -> some View`
 
 反转视图中的颜色。
 */
struct SU_ColorInvert: View {
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
                .colorInvert()
        }
    }
}

struct SU_ColorInvert_Previews: PreviewProvider {
    static var previews: some View {
        SU_ColorInvert()
    }
}
