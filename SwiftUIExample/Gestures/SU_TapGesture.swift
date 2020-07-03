//
//  SU_TapGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TapGesture: View {
    
    @State var tapped: Bool = false
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded {
                tapped.toggle()
            }
    }
    
    
    var body: some View {
        Text("Hello, World!")
            .padding(.all, 20)
            .background(Color.orange)
            .gesture(tap)
            .alert(isPresented: $tapped) {
                Alert(title:  Text("Hello, World!"))
            }
    }
}

struct SU_TapGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_TapGesture()
    }
}
