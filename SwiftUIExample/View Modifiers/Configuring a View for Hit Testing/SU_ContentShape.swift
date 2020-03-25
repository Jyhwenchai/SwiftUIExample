//
//  SU_ContentShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape`
 
 定义点击测试的内容形状。
 eoFill 定义是否使用奇偶绕组数规则解释形状
 */
struct SU_ContentShape: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("inner Rectangle clicked.")
            }

            Rectangle()
                .fill(Color.red.opacity(0.5))
                .frame(width: 300, height: 300)
                .allowsHitTesting(false)
                // 使用后该矩形的边缘不接受点击效果
                .contentShape(Circle(), eoFill: false)
                .onTapGesture {
                     print("out Rectangle clicked.")
                }
        }
    }
}

struct SU_ContentShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_ContentShape()
    }
}
