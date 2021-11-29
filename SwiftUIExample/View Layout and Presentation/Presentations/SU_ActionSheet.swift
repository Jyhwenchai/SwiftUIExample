//
//  SU_ActionSheet.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

// 在 iOS15 中废弃，使用类似 `confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)` 修改器替代
struct SU_ActionSheet: View {
    @State var showActionSheet = false
    var body: some View {
        Button(action: {
            self.showActionSheet = true
        }) {
            Text("show alert")
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("title"),
                message: Text("this is content"),
                buttons: [.default(Text("OK")),
                          .cancel(Text("cancle"))])
       }
   }
}

struct SU_ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        SU_ActionSheet()
    }
}
