//
//  SU_Animation.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func animation(_ animation: Animation?) -> some View`
 
 将给定的动画应用于视图中的所有可动画的值。
 */
struct SU_Animation: View {
    @State var opacity = 0.0
    var body: some View {
        Text("Hello, World!")
            .opacity(opacity)
            .onAppear(perform: {
                self.opacity = 1
            })
            .animation(Animation.easeIn(duration: 2))
    }
}

struct SU_Animation_Previews: PreviewProvider {
    static var previews: some View {
        SU_Animation()
    }
}
