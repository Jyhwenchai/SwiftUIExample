//
//  SU_ForEach.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

private struct NamedFont: Identifiable {
    let name: String
    let font: Font
    var id: String { name }
}

private let namedFonts: [NamedFont] = [
    NamedFont(name: "Large Title", font: .largeTitle),
    NamedFont(name: "Title", font: .title),
    NamedFont(name: "Headline", font: .headline),
    NamedFont(name: "Body", font: .body),
    NamedFont(name: "Caption", font: .caption)
]

struct SU_ForEach: View {

    var body: some View {
        VStack {
            // `init(_:content:)`
            ForEach(0..<4) {
                Text("Row \($0)")
            }
               
            // `init(_:content:)`
            ForEach(namedFonts) { namedFont in
                Text(namedFont.name)
                    .font(namedFont.font)
            }
        }
    }
}

struct SU_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SU_ForEach()
    }
}
