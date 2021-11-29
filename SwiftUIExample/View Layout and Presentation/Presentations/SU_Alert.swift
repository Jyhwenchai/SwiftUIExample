//
//  SU_Alert.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

// 在 iOS15 中废弃，使用类似 `alert(_:isPresented:presenting:actions:message:)` 替代
struct SU_Alert: View {
    @State var showAlert = false
    var body: some View {
        Button(action: {
            self.showAlert = true
        }) {
            Text("show alert")
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("alert title"),
                  message: Text("receive a message"),
                  primaryButton: Alert.Button.default(Text("OK")),
                secondaryButton: Alert.Button.cancel())
        }
    }
}

struct SU_Alert_Previews: PreviewProvider {
    static var previews: some View {
        SU_Alert()
    }
}
