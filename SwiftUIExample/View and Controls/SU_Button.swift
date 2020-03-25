//
//  SU_Button.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Button: View {
    var body: some View {
        Button("Button", action: {
            print("Button clicked.")
        })
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct SU_Button_Previews: PreviewProvider {
    static var previews: some View {
        SU_Button()
    }
}
