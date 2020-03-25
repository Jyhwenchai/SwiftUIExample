//
//  SU_HightPriorityGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func highPriorityGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture`
 
 默认子视图手势的优先级高于父视图，如果希望父视图的手势有更高的优先级，则可以使用此修改器调整
 
 > 调整优先级后，优先级低的手势将不被触发
 */
struct SU_HightPriorityGesture: View {
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .onTapGesture {
                    print("Innter Gesture Action")
                }
        }
//            .onTapGesture {
//                print("Outer Gesture Action")
//            }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("Outer Gesture Action")
                }
        )
    }
}

struct SU_HightPriorityGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_HightPriorityGesture()
    }
}
