//
//  SU_ImageScale.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
// TODO? 未知作用
struct SU_ImageScale: View {
    var body: some View {
        VStack {
            Image("1")
                .imageScale(.small)
        }
    }
}

struct SU_ImageScale_Previews: PreviewProvider {
    static var previews: some View {
        SU_ImageScale()
    }
}
