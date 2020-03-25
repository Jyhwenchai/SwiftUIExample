//
//  SU_OnTapGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func onTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View`
 
 为视图添加轻触事件。`count` 定义了轻触触发响应事件需要的次数
 */
struct SU_OnTapGesture: View {
    @State var scale = false
    var body: some View {
        VStack {
            Circle()
                .fill(Color.green)
                .frame(width: scale ? 200 : 100, height: scale ? 200 : 100)
                .animation(.spring())
                .onTapGesture {
                    self.scale.toggle()
                }
            
            Circle()
                .fill(Color.green)
                .frame(width: scale ? 200 : 100, height: scale ? 200 : 100)
                .animation(.spring())
                .onTapGesture(count: 2) {
                    self.scale.toggle()
                }
        }
    }
}

struct SU_OnTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnTapGesture()
    }
}
