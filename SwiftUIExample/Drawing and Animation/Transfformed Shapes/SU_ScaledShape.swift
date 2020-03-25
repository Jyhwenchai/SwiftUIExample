//
//  SU_ScaledShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

// 对其父级 `View` 应用了比例转换后的形状。
struct SU_ScaledShape: View {
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            VStack {
                ScaledShape(shape: Circle(), scale: CGSize(width: 1, height: 0.5))
                    .fill(Color.blue)
            }.background(Color.yellow)
        }
        .frame(width: 200, height: 200)
        .background(Color.red)
        
        
    }
}

struct SU_ScaledShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_ScaledShape()
    }
}
