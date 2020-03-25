//
//  SU_ForEach.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_ForEach: View {

    var body: some View {
        VStack {
            ForEach(0..<20) {
                Text("Row \($0)")
            }
        }
    }
}

struct SU_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SU_ForEach()
    }
}
