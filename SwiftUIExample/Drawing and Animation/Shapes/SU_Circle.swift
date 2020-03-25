//
//  SU_Circle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Circle: View {
    var body: some View {
        Circle()
            .fill(Color.blue, style: FillStyle())
            .frame(width: 200, height: 200, alignment: .center)
            .overlay(Circle().stroke(Color.yellow, lineWidth: 10))
    }
}

struct SU_Circle_Previews: PreviewProvider {
    static var previews: some View {
        SU_Circle()
    }
}
