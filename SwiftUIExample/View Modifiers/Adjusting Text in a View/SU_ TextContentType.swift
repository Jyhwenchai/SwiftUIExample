//
//  SU_ TextContentType.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func textContentType(_ textContentType: UITextContentType?) -> some View`
 
  暂时未知
 */
struct SU_TextContentType: View {
    @State var value = ""
    var body: some View {
        TextField("Hello, World!", text: $value)
            .fixedSize()
            .textContentType(.telephoneNumber)
            .keyboardType(.numberPad)
    }
}

struct SU_TextContentType_Previews: PreviewProvider {
    static var previews: some View {
        SU_TextContentType()
    }
}

