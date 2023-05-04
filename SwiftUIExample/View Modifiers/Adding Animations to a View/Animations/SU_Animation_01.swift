//
//  SU_Animation_01.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/26.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 你可以在 `Animation` 这里找到许多动画函数，包括常见的先慢后快、先快后慢、开始和结束慢、线性以及弹性动画和自定义时间曲线等
 */
struct SU_Animation_01: View {
    @State var showCircle = false
    @State var scaleAndMove = false
    
    @State var showRectangleAnimate = false
    
    var body: some View {
        VStack(spacing: 100) {
            VStack(spacing: 15) {
                Circle()
                    .fill(showCircle ? Color.orange : Color.green)
                    .frame(width: showCircle ? 150 : 70, height: showCircle ? 150 : 70)
                    .opacity(showCircle ? 1 : 0.5)
                    .scaleEffect(scaleAndMove ? 2 : 1)
                    .offset(x: scaleAndMove ? -50 : 0, y: scaleAndMove ? -100 : 0)
//                    .animation(Animation.easeIn(duration: 2))
//                    .animation(.easeInOut(duration: 1.0))
                    .animation(.default)

                Button(action: { self.showCircle.toggle() }) {
                    Text("color / opacity / frame Animate")
                }
                Button(action: { self.scaleAndMove.toggle() }) {
                    Text("scale / move Animate")
                }
            }

            VStack(spacing: 45) {
                RoundedRectangle(cornerRadius: showRectangleAnimate ? 100 : 10)
                    .fill(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                    .frame(width: 200, height: showRectangleAnimate ? 200 : 170)
                .animation(
                    Animation.default
                        .speed(0.75)
                        .delay(0.5)
                        .repeatCount(1)
                )
                
                Button(action: { self.showRectangleAnimate.toggle() }) {
                    Text("adjust animate speed、delay and repeat count")
                }
            }.frame(height: 300)
        }
    }
}

struct SU_Animation_01_Previews: PreviewProvider {
    static var previews: some View {
        SU_Animation_01()
    }
}
