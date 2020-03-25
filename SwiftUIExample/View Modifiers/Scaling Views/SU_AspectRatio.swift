//
//  SU_AspectRatio.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func aspectRatio(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> some View`
 
 将视图的尺寸限制为指定的宽高比, `aspectRatio` 只对视图水平方向有效，高度比例视为 1.0
 
 `func aspectRatio(_ aspectRatio: CGSize, contentMode: ContentMode) -> some View`
 
  将视图的尺寸限制为指定尺寸的长宽比。, `aspectRatio` 对视图水平方向与垂直方向的比例值
 
 */
struct SU_AspectRatio: View {
    var body: some View {
        VStack(spacing: 50) {
            // 宽高比： 0.55 : 1.0
            Ellipse()
                .fill(Color.purple)
                .aspectRatio(0.55, contentMode: .fit)
                .frame(width: 200, height: 200)
                .border(Color(white: 0.75))
            
            // 宽高比： 0.8 : 1.2
            Ellipse()
                .fill(Color.purple)
                .aspectRatio(CGSize(width: 0.8, height: 1.2), contentMode: .fill)
                .frame(width: 200, height: 200)
                .border(Color(white: 0.75))
        }
    }
}

struct SU_AspectRatio_Previews: PreviewProvider {
    static var previews: some View {
        SU_AspectRatio()
    }
}
