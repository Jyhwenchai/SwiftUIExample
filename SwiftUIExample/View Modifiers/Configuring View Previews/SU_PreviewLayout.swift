//
//  SU_PreviewLayout.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func previewLayout(_ value: PreviewLayout) -> some View`
 
 自定义预览视图的大小
 */
struct SU_PreviewLayout: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct SU_PreviewLayout_Previews: PreviewProvider {
    static var previews: some View {
        SU_PreviewLayout()
            .previewLayout(PreviewLayout.fixed(width: 400, height: 50))
    }
}
