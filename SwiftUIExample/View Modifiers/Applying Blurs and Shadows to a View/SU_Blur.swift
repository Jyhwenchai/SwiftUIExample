//
//  SU_Blur.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Blur: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .blur(radius: 3)
    }
}

struct SU_Blur_Previews: PreviewProvider {
    static var previews: some View {
        SU_Blur()
    }
}
