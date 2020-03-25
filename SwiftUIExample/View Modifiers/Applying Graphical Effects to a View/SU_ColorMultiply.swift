//
//  SU_ColorMultiply.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func colorMultiply(_ color: Color) -> some View`
 
 向视图添加颜色乘法效果。
 */
struct SU_ColorMultiply: View {
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
                .colorMultiply(Color.orange)
        }
    }
}

struct SU_ColorMultiply_Previews: PreviewProvider {
    static var previews: some View {
        SU_ColorMultiply()
    }
}
