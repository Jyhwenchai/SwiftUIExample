//
//  SU_Antialiased.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func antialiased(_ isAntialiased: Bool) -> Image`
 
 官方说明为指示是否将平滑应用于图片的边缘。具体的应用暂时未知
 */
struct SU_Antialiased: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("2")
                .resizable()
                .antialiased(true)
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
                .clipped(antialiased: false)    // 具有与 antialiased() 修改器相同的参数
        }
    }
}

struct SU_Antialiased_Previews: PreviewProvider {
    static var previews: some View {
        SU_Antialiased()
    }
}
