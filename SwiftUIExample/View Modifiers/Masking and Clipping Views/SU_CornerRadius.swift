//
//  SU_CornerRadius.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func cornerRadius(_ radius: CGFloat, antialiased: Bool = true) -> some View`
 
 为视图应用圆角效果，`antialiased` 指示是否将平滑应用于剪切矩形的边缘。
 */
struct SU_CornerRadius: View {
    var body: some View {
        VStack {
            VStack { EmptyView() }
                .frame(width: 100, height: 100)
                .background(Color.orange)
                .cornerRadius(20)
            Image(systemName: "teletype")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(50)
        }
    }
}

struct SU_CornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        SU_CornerRadius()
    }
}
