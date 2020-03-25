//
//  SU_AnyView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_AnyView: View {
    @State var toggle = false
    var body: some View {

        Button(action: { self.toggle = !self.toggle } ) {
            if toggle {
                AnyView(Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/))
            } else {
                AnyView(Image(systemName: "message.fill"))
            }
        }
    
    }
}

struct SU_AnyView_Previews: PreviewProvider {
    static var previews: some View {
        SU_AnyView()
    }
}
