//
//  CH002_NewForegroundStyles.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_NewForegroundStyles: View {
    var body: some View {
        VStack {
            // 下面的几个前景色可以调整透明度的程度
            Text("iJustine")
                .foregroundStyle(.primary)
            Text("Tim")
                .foregroundStyle(.secondary)
            Text("Steve")
                .foregroundStyle(.tertiary)
            Text("Bill")
                .foregroundStyle(.quaternary)
        }
        // 改变整体的前景色
        .foregroundStyle(.purple)
    }
}

struct CH002_NewForegroundStyles_Previews: PreviewProvider {
    static var previews: some View {
        CH002_NewForegroundStyles()
    }
}
