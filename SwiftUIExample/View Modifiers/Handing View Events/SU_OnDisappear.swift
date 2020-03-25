//
//  SU_OnDisappear.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func onDisappear(perform action: (() -> Void)? = nil) -> some View`
 
 当视图消失时添加一个响应事件
 */
struct SU_OnDisappear: View {
    @State var showActionSheet = false
    var body: some View {
        Button(action: {
            self.showActionSheet = true
        }) {
            Text("Go to new page")
        }
        .sheet(isPresented: $showActionSheet) {
            VStack {
                Text("Modal View")
                Button("Dismiss") {
                    self.showActionSheet = false
                }
            }.onDisappear {
                print("View Disappear")
            }
        }
    }
}

struct SU_OnDisappear_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnDisappear()
    }
}
