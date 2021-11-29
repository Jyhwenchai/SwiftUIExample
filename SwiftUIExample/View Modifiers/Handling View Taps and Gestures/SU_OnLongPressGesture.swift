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
 `minimumDuration` 触发手势所需的最短时间
 `maximumDistance` 手指或光标执行长按时可以移动的最大距离，超过此距离手势失效
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
            .onLongPressGesture(minimumDuration: 0.15, maximumDistance: 10, perform: {
                self.scale.toggle()
            }, onPressingChanged: { changed in
                print("pressing...")
            })
    }
}

struct SU_OnLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnLongPressGesture()
    }
}
