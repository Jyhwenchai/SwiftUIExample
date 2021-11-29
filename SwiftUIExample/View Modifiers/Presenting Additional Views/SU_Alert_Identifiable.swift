//
//  SU_Alert_Identifiable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `Identifiable` 在 `.alert` 中的应用
 
 > 其它相关示例见 **Presentations** 文件
 */
struct Print: Identifiable {
    var id: Int
    var text: String
}
struct SU_Alert_Identifiable: View {

    @State private var selectedUser: Print? = nil
    @State var isAlert: Bool = false
    var body: some View {
        if #available(iOS 15.0, *) {
            Text("Hello, World!")
                .onTapGesture {
                    isAlert.toggle()
                    self.selectedUser = Print(id: 100000, text: "Hello, World")
                }
                .alert("Title", isPresented: $isAlert, presenting: selectedUser, actions: { print in
                        
                    Button("OK") {}
                    Button("Cancel") {}
                    Button(action: {}) {
                        Label("Retry", systemImage: "circle.grid.cross.left.fill")// 无法渲染图片
                    }
                }) { detail in
                    Text(detail.text)   // 只能渲染一个
                    Text(detail.text)
                }
        } else {
            Text("Hello, World!")
                .onTapGesture {
                    self.selectedUser = Print(id: 100000, text: "Hello, World")
                }
                .alert(item: $selectedUser) { print in
                    Alert(title: Text("id \(print.id)"), message: Text(print.text))
                }
        }
    }
}

struct SU_Alert_Identifiable_Previews: PreviewProvider {
    static var previews: some View {
        SU_Alert_Identifiable()
    }
}
