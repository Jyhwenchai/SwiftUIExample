//
//  SU_Color.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Color: View {
    var body: some View {
        VStack {
            Color(.blue)
        }.frame(width: 200, height: 200, alignment: .center)
    }
}

struct SU_Color_Previews: PreviewProvider {
    static var previews: some View {
        SU_Color()
    }
}
