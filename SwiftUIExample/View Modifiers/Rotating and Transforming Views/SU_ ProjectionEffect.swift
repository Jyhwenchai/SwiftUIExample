//
//  SU_ ProjectionEffect.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func projectionEffect(_ transform: ProjectionTransform) -> some View`
 可以对视图应用投影变换效果，与 `UIKit` 中 `CATransform3D` 相同。
 */
struct SU__ProjectionEffect: View {
    var body: some View {
        VStack(spacing: 150) {
            Text("Hello, World!")
                .font(.largeTitle)
                .projectionEffect(
                    ProjectionTransform(CGAffineTransform(translationX: 20, y: 20))
                )
            
            Text("Hello, World")
                .font(.largeTitle)
                .projectionEffect(
                    ProjectionTransform(
                        CATransform3DRotate(CATransform3DIdentity, .pi / 4, 1, 1, 0)
                    )
                )
        }
    }
}

struct SU__ProjectionEffect_Previews: PreviewProvider {
    static var previews: some View {
        SU__ProjectionEffect()
    }
}
