//
//  SU_Padding.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
`padding` 为视图的边缘提供一定的间隙
 */
struct SU_Padding: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!").padding().background(Color.red)
            Text("Hello, World!").padding(20).background(Color.red)
            Text("Hello, World!").padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40)).background(Color.red)
            Text("Hello, World!").padding(Edge.Set.top, 20.0).background(Color.red)
        }
    }
}

struct SU_Padding_Previews: PreviewProvider {
    static var previews: some View {
        SU_Padding()
    }
}
