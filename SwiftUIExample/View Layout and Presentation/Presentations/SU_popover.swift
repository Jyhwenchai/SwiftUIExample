//
//  SU_popover.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 在 iPad、Mac 上有效，iPhone 上效果与 sheet 相同
 */

struct SU_popover: View {
    @State var showActionSheet = false
    var body: some View {
        Button(action: {
            self.showActionSheet = true
        }) {
            Text("show alert")
        }
        .popover(isPresented: $showActionSheet, arrowEdge: .leading) {
            Text("New Page")
        }
    }
}

struct SU_popover_Previews: PreviewProvider {
    static var previews: some View {
        SU_popover()
    }
}
