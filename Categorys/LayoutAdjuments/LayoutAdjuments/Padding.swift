//
//  Padding.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        Text("Hello, World!")
      /// 为视图添加内边距,可设置需要设置不同位置的内边距
        .padding(.all)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .padding(.leading, 20)
        .border(Color.black)
    }
}

#Preview {
    Padding()
}
