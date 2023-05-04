//
//  SU_Button.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Button: View {
    
    @State var isClicked: Bool = false
    
    var body: some View {
        VStack {
            // `init(_:action:)`
            Button("Button", action: {
                print("Button clicked.")
            })
            .buttonStyle(.borderless)
            
            // `init(action:label:)`
            Button {
                isClicked.toggle()
            } label: {
                if isClicked {
                    Label("Rain", systemImage: "cloud.rain")
                } else {
                    Label("Sun", systemImage: "sun.max")
                }
            }

          Button("Delete", role: .destructive) {}
        }
        
    }
}

struct SU_Button_Previews: PreviewProvider {
    static var previews: some View {
        SU_Button()
    }
}
