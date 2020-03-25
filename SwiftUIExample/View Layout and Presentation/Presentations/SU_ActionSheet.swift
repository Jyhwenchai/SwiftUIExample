//
//  SU_ActionSheet.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

#warning("TODO: 如何自定义 ActionSheet 中的文本样式")
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
