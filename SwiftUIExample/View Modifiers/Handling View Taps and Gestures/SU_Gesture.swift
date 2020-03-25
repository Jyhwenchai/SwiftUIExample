//
//  SU_Gesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func gesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture`
 
 我们可以为视图组合多个手势，多个手势间的执行顺序进行依赖。
 
 > 示例来源于 https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui
 */
struct SU_Gesture: View {
    // 圆拖动聚距离
    @State private var offset = CGSize.zero

    // 是否允许拖动
    @State private var isDragging = false

    var body: some View {
        // 拖动手势，它在移动时更新 offset 和 isDragging
        let dragGesture = DragGesture()
            .onChanged { value in self.offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }

        // 长按手势来更新 isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }

        // 迫使用户长按然后拖动的组合手势
        let combined = pressGesture.sequenced(before: dragGesture)

        // 一个64x64的圆圈，在拖动时会放大，将其偏移设置为我们从拖动手势返回的位置，并使用我们的组合手势
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct SU_Gesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_Gesture()
    }
}
