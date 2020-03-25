//
//  SU_Rectangle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Rectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue, style: FillStyle())
            .border(Color.green, width: 10)
            .offset(x: 20, y: 20)
            .rotationEffect(Angle(degrees: 45))
            .scaleEffect(0.8)
            .transformEffect(CGAffineTransform(translationX: 0, y: -20))
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct SU_Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        SU_Rectangle()
    }
}
