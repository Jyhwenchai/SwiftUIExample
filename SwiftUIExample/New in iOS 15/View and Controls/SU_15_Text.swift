//
//  SU_15_Text.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/25.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI
// 现在 Text 支持 Markdown
struct SU_15_Text: View {
  var body: some View {
    VStack {
      Text(" **[WWDC 2021](https://developer.apple.com/wwdc21/)**")
      Text(try! AttributedString(markdown: "_WWDC_, **WWDC**"))
        .font(.system(size: 22, weight: .light, design: .monospaced))
    }
  }
}

struct SU_15_Text_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_Text()
    }
}
