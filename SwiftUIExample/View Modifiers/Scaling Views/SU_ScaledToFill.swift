//
//  SU_ScaledToFill.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func scaledToFill() -> some View`
 
 缩放视图以使其适合其父视图宽高的最大值，并保持该视图的长宽比。与 `UIKit` 中 `UIViewContentModeScaleToFill` 对应
 */
struct SU_ScaledToFill: View {
    var body: some View {
        Circle()
            .fill(Color.pink)
            .scaledToFill()
            .frame(width: 300, height: 150)
            .border(Color(white: 0.75))
    }
}

struct SU_ScaledToFill_Previews: PreviewProvider {
    static var previews: some View {
        SU_ScaledToFill()
    }
}
