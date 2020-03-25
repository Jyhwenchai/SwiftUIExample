//
//  SU_Shadow.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Shadow: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color.orange, radius: 2, x: 15, y: 15)
    }
}

struct SU_Shadow_Previews: PreviewProvider {
    static var previews: some View {
        SU_Shadow()
    }
}
