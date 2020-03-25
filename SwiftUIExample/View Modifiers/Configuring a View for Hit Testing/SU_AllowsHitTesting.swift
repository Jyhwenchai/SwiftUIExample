//
//  SU_AllowsHitTesting.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func allowsHitTesting(_ enabled: Bool) -> some View`
 
 SwiftUI 允许我们使用此修改器修饰符阻止视图接收任何类型的点击。如果为false则不允许对视图进行命中响应，则所有轻击会自动在视图中继续进行，直到后面的任何内容。
 */
struct SU_AllowsHitTesting: View {
    var body: some View {
        ZStack {
            Button("Tap Me") {
                print("Button was tapped")
            }
            .frame(width: 100, height: 100)
            .background(Color.white)

            Circle()
                .fill(Color.red.opacity(0.5))
                .frame(width: 300, height: 300)
                .allowsHitTesting(false)
        }
    }
}

struct SU_AllowsHitTesting_Previews: PreviewProvider {
    static var previews: some View {
        SU_AllowsHitTesting()
    }
}
