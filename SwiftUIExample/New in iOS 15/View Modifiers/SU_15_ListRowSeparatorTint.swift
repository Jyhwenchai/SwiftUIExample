//
//  SU_15_ListRowSeparatorTint.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/24.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SU_15_ListRowSeparatorTint: View {
    var body: some View {
        List {
            Text("Hello, World")
            Text("Hello, Swift")
                .listRowSeparatorTint(Color.red, edges: .top)   // default is .all
                .listRowSeparatorTint(Color.blue, edges: .bottom)
            Text("Hello, SwiftUI")
            Text("Hello, SwiftUI 2")
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_ListRowSeparatorTint_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_ListRowSeparatorTint()
    }
}
