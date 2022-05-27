//
//  Ch001_OnSubmit.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

// run in simulator
struct CH001_OnSubmit: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("OnTrigger...")
                TextField("Type Here", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .searchable(text: .constant(""))
            .navigationTitle("Home")
        }
        // 为给定视图添加响应事件
        .onSubmit(of: [.search, .text]) {
           print("Search filed submitted...")
        }
    }
}

struct CH001_OnSubmit_Previews: PreviewProvider {
    static var previews: some View {
        CH001_OnSubmit()
    }
}
