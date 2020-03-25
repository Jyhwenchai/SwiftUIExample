//
//  SU_ScaleEffect.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some View`
 `func scaleEffect(_ scale: CGSize, anchor: UnitPoint = .center) -> some View`
 `func scaleEffect(x: CGFloat = 0.0, y: CGFloat = 0.0, anchor: UnitPoint = .center) -> some View`
 
 实现对视图进行缩放
 */
struct SU_ScaleEffect: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .scaleEffect(1.5, anchor: .bottom)
                .border(Color.blue)
            
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .scaleEffect(CGSize(width: 1.3, height: 0.7), anchor: .center)
                .border(Color.blue)
            
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .scaleEffect(x: 0.5, y: 0.8, anchor: .center)
                .border(Color.blue)
        }
    }
}

struct SU_ScaleEffect_Previews: PreviewProvider {
    static var previews: some View {
        SU_ScaleEffect()
    }
}
