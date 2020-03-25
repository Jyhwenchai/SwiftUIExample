//
//  SU_MinimumScaleFactor.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func minimumScaleFactor(_ factor: CGFloat) -> some View`
 
 如果你放在视图中的文本不合适（视图的大小不够容纳文本），那么这个修改器将应用缩放使文本合适视图的大小，缩放的结果不会超过 `factor` 的比例。
 */
struct SU_MinimumScaleFactor: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .minimumScaleFactor(0.5)
        }
        .frame(width: 100, height: 40)
    }
}

struct SU_MinimumScaleFactor_Previews: PreviewProvider {
    static var previews: some View {
        SU_MinimumScaleFactor()
    }
}
