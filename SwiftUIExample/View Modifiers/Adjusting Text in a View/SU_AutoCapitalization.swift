//
//  SU_AutoCapitalization.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func autocapitalization(_ style: UITextAutocapitalizationType) -> some View`
 暂时未知
 */
struct SU_AutoCapitalization: View {
    var body: some View {
        Text("Hello, world!")
//            .autocapitalization(.words) // 在 iOS 15 中废弃
        .textInputAutocapitalization(.words)
    }
}

struct SU_AutoCapitalization_Previews: PreviewProvider {
    static var previews: some View {
        SU_AutoCapitalization()
    }
}
