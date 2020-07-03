//
//  SU_MagnificationGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// 缩放手势
struct SU_MagnificationGesture: View {
    
    @GestureState var magnifyBy = CGFloat(1.0)
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100 * magnifyBy,
                   height: 100 * magnifyBy,
                   alignment: .center)
            .gesture(magnification)
    }
}

struct SU_MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_MagnificationGesture()
    }
}
