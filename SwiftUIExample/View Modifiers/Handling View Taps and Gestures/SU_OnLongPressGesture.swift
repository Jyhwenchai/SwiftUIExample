//
//  SU_OnLongPressGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func onLongPressGesture(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, pressing: ((Bool) -> Void)? = nil, perform action: @escaping () -> Void) -> some View`
 
 为视图添加长按手势。
 `minimumDuration` 触发手势所需的最短事件
 `maximumDistance` 暂时未知用途
 `pressing` 可以监听事件变化的过程
 `action` 长按事件完成回调
 */
struct SU_OnLongPressGesture: View {
    @State var scale = false
    var body: some View {
        Circle()
            .fill(Color.orange)
            .frame(width: scale ? 200 : 100, height: scale ? 200 : 100)
            .animation(.spring())
            .onLongPressGesture(minimumDuration: 0.15, maximumDistance: 10, pressing: { state in
                print("pressing...")
            }) {
                self.scale.toggle()
            }
            
    }
}

struct SU_OnLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnLongPressGesture()
    }
}
