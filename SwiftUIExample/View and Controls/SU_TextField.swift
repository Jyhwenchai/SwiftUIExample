//
//  SU_TextField.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/10.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TextField: View {
    @State var input: String = "input text"
    var body: some View {
        // bind a value
        TextField("this is placeholder", text: $input, onEditingChanged: { editing in
            print(editing ? "begin editing..." : "end editing...")
        }, onCommit: {
            print("commit")
        })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .font(.system(size: 25))
            .foregroundColor(.red)
            .padding()
    }
}

struct SU_TextField_Previews: PreviewProvider {
    static var previews: some View {
        SU_TextField()
    }
}
