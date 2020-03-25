//
//  SU_Disabled.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Disabled: View {
    var body: some View {
        Button(action: {}) { Text("Click me") }
            .disabled(true)
    }
}

struct SU_Disabled_Previews: PreviewProvider {
    static var previews: some View {
        SU_Disabled()
    }
}
