//
//  SU_GestureState.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `GestureState`
///
/// 使用 `GestureState` 与 `@State` 跟踪的值的不同是，在手势结束后 `GestureState` 会自动将值设置为初始值，而如果使用 `@State` 则需要我们手动设置
struct SU_GestureState: View {
    
    @State var isDragging = false
    @GestureState var offset = CGSize.zero
    @State var newPosition = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .updating($offset) { (value, state, transaction) in
                state = value.translation
            }
            .onEnded { value in
                isDragging = false
                newPosition.width += value.translation.width
                newPosition.height += value.translation.height
            }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: offset.width + newPosition.width, y: offset.height + newPosition.height)
            .gesture(drag)
    }
}

struct SU_GestureState_Previews: PreviewProvider {
    static var previews: some View {
        SU_GestureState()
    }
}
