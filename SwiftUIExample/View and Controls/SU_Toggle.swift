//
//  SU_Toggle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Toggle: View {
    @State var isOpen: Bool = false
    var body: some View {
        VStack {
            Toggle(isOn: $isOpen) {
                Text(isOpen ? "open" : "close")
            }
            .fixedSize()
            .toggleStyle(.switch)
            //        .labelsHidden()
            
            Toggle("\(isOpen ? "open" : "close")", isOn: $isOpen)
                .fixedSize()
        }
    }
}

struct SU_Toggle_Previews: PreviewProvider {
    static var previews: some View {
        SU_Toggle()
    }
}
