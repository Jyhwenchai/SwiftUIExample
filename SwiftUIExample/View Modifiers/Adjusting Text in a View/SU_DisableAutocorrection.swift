//
//  SU_DisableAutocorrection.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func disableAutocorrection(_ disable: Bool?) -> some View`
 
 默认情况下，`SwiftUI` 的 `TextField` 启用自动更正功能，这在大多数情况下都是您需要的。但是，如果要禁用它，可以使用此修改器来实现，
 
 > 你可以运行起来观察前后键盘的变化
 */
struct SU_DisableAutocorrection: View {
    @State var value = ""
    var body: some View {
        TextField("Enter your name", text: $value)
            .fixedSize()
            .disableAutocorrection(true)
    }
}

struct SU_DisableAutocorrection_Previews: PreviewProvider {
    static var previews: some View {
        SU_DisableAutocorrection()
    }
}
