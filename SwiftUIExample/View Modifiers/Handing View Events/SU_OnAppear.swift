//
//  SU_Appear.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func onAppear(perform action: (() -> Void)? = nil) -> some View`
 
 当视图出现是添加一个响应事件
 */
struct SU_OnAppear: View {
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
            }.onAppear {
                print("View Appear")
            }
        }
    }
}

struct SU_OnAppear_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnAppear()
    }
}
