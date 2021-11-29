//
//  SU_Section.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

//: 可用于向某些集合视图添加层次结构的容器视图，例如在（List、Picker、Form）中
struct SU_Section: View {
    
    private var header: some View {
        HStack {
            Image(systemName: "icloud.and.arrow.up.fill")
                .foregroundColor(.blue)
            Text("Section Header")
        }
    }
    
    private var footer: some View {
        HStack {
            Image(systemName: "icloud.and.arrow.up.fill")
                .foregroundColor(.blue)
            Text("Section Footer")
        }
    }
    
    var body: some View {
        Form {
            Section(header: header, footer: footer) {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Section(header: header, footer: footer) {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

struct SU_Section_Previews: PreviewProvider {
    static var previews: some View {
        SU_Section()
    }
}
