//
//  SU_15_Searchable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/25.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

let messages: [String] = [
    "apple",
    "pear",
    "banana",
    "orange",
    "grape",
]

// `searchable(text:placement:prompt:)` 可以将视图标记为可搜索，这将配置搜索字段的显示。
@available(iOS 15.0.0, *)
struct SU_15_Searchable: View {
    
    @State var searchText: String = ""
    @State var showMessages: [String] = messages
    
    var body: some View {
        NavigationView {
            List(showMessages, id: \.self) { message in
                NavigationLink(destination: Text(message)) {
                    Text(message)
                }
            }
            .navigationTitle("Searchable")
        }
        .searchable(text: $searchText) {
            Text("🍎 apple").searchCompletion("apple")
            Text("🍐 pear").searchCompletion("pear")
            Text("🍌 banana").searchCompletion("banana")
            Text("🍊 orange").searchCompletion("orange")
            Text("🍇 grape").searchCompletion("grape")
        }
        .onSubmit(of: .search) {
            print("select \(searchText)")
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_Searchable_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_Searchable()
    }
}
