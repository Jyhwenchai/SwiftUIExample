//
//  SU_ColorScheme.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

// 便于测试时使用
struct SU_ColorScheme: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(Color("test")) // color defined at Assets file
    }
}

struct SU_ColorScheme_Previews: PreviewProvider {
    static var previews: some View {
        SU_ColorScheme().colorScheme(.light)
            .previewLayout(PreviewLayout.fixed(width: 120, height: 100))
        SU_ColorScheme().colorScheme(.dark)
            .previewLayout(PreviewLayout.fixed(width: 120, height: 100))
    }
}
