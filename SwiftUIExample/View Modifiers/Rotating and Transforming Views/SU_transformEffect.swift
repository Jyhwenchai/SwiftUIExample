//
//  SU_transformEffect.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func transformEffect(_ transform: CGAffineTransform) -> some View`
 
 为视图应用一个二维变换效果
 */
struct SU_transformEffect: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .transformEffect(CGAffineTransform(translationX: 20, y: 20))
            .background(Color.blue)
    }
}

struct SU_transformEffect_Previews: PreviewProvider {
    static var previews: some View {
        SU_transformEffect()
    }
}
