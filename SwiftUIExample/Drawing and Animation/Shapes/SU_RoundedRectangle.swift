//
//  SU_RoundedRectangle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_RoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15, style: .circular)
            .fill(Color.blue, style: FillStyle())
            .frame(width: 200, height: 200)
    }
}

struct SU_RoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        SU_RoundedRectangle()
    }
}
