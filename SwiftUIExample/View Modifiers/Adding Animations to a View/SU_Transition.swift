//
//  SU_Transition.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Transition: View {
    @State var toggle = false
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.toggle.toggle()
                }
            }) {
                Text("show detail content")
            }
    
            if toggle {
                Text("this is detail content")
                    .transition(.slide)
            }
        }
    }
}

struct SU_Transition_Previews: PreviewProvider {
    static var previews: some View {
        SU_Transition()
    }
}
