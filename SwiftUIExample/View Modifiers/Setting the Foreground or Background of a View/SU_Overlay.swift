//
//  SU_Overlay.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func overlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .center) -> some View where Overlay : View`
 
 可以为当前视图前面提供了一个额外的视图，其中 `overlay` 可以是满足 `View` 协议的任意视图
 */
struct SU_Overlay: View {
    var body: some View {
        VStack {
            ZStack {
                Color(.orange)
                Text("Hello, World!")
            }
        }.overlay(Color(.black).opacity(0.3))
    }
}

struct SU_Overlay_Previews: PreviewProvider {
    static var previews: some View {
        SU_Overlay()
    }
}
