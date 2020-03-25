//
//  SU_SecureField.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/10.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_SecureField: View {
    @State var input: String = "password"
    var body: some View {
        SecureField("this is placeholder", text: $input) {
            print("commit...")
        }
            .multilineTextAlignment(.center)
            .font(.system(size: 25))
            .foregroundColor(.red)
            .padding()
    }
}

struct SU_SecureField_Previews: PreviewProvider {
    static var previews: some View {
        SU_SecureField()
    }
}
