//
//  SU_SimultaneousGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func simultaneousGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture`
 
 将手势附加到视图以与视图已存在的手势同时处理
 */
struct SU_SimultaneousGesture: View {
     var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .onTapGesture {
                    print("Innter Gesture Action")
            }
        }
        .simultaneousGesture (
            TapGesture()
                .onEnded {
                    print("Outer Gesture Action")
            }, including: GestureMask.gesture
        )
    }
}

struct SU_SimultaneousGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_SimultaneousGesture()
    }
}
