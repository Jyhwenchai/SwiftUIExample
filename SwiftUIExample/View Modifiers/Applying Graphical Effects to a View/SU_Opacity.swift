//
//  SU_Opacity.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 视图透明度调整
 */
struct SU_Opacity: View {
    var body: some View {
        Circle()
            .fill(Color.orange)
            .frame(width: 200, height: 200)
            .opacity(0.3)
    }
}

struct SU_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        SU_Opacity()
    }
}
