//
//  CH_001_KeyboardDoneAlternative.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

// 修改 keyboard 完成文本
struct CH001_KeyboardDoneAlternative: View {
    
    var body: some View {
        TextField("iJustine", text: .constant(""))
            .textFieldStyle(.roundedBorder)
            .submitLabel(.search)
            .padding()
    }
}

struct CH_001_KeyboardDoneAlternative_Previews: PreviewProvider {
    static var previews: some View {
        CH001_KeyboardDoneAlternative()
    }
}


