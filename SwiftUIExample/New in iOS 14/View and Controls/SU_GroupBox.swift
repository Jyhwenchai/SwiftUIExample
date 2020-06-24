//
//  SU_GroupBox.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_GroupBox: View {
    var body: some View {
        GroupBox(label: Text("Group 1"), content: {
            Group {
                VStack {
                    ForEach(1..<5) {
                        Text("Group 1, row \($0)")
                    }
                }
            }
        })
    }
}

struct SU_GroupBox_Previews: PreviewProvider {
    static var previews: some View {
        SU_GroupBox()
    }
}
