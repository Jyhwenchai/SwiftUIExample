//
//  SU_PreviewDisplayName.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func previewDisplayName(_ value: String?) -> some View`
 
 提供在编辑器中显示的用户可见名称。
 */
struct SU_PreviewDisplayName: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct SU_PreviewDisplayName_Previews: PreviewProvider {
    static var previews: some View {
        SU_PreviewDisplayName()
            .previewDisplayName("iPhone 11")
    }
}
