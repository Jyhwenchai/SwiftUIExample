//
//  SU_ truncationMode.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
`func truncationMode(_ mode: Text.TruncationMode) -> some View`
 
 当视图空间不够容纳文本时，设置其截断模式。（...的位置不同）
 */
struct SU_TruncationMode: View {
    var body: some View {
        Text("Use the truncationMode(_:) modifier to determine whether text in a long line is truncated at the beginning, middle, or end. Truncation adds an ellipsis (…) to the line when removing text to indicate to readers that text is missing.")
            .frame(width: 400, height: 80)
            .truncationMode(.head)
    }
}

struct SU_TruncationMode_Previews: PreviewProvider {
    static var previews: some View {
        SU_TruncationMode()
    }
}
