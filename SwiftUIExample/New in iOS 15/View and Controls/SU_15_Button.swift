//
//  SU_15_Button.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/25.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
fileprivate struct Item: Identifiable {
    var id = UUID()
    var color: Color
    var name: String
    var controlSize: ControlSize
}

@available(iOS 15.0.0, *)
struct SU_15_Button: View {
    
    fileprivate let items: [Item] = [
        Item(color: .red, name: "Hello, Swift!", controlSize: .mini),
        Item(color: .green, name: "Hello, SwiftUI!", controlSize: .small),
        Item(color: .blue, name: "Hello, SwiftUI 2!", controlSize: .regular),
        Item(color: .yellow, name: "Hello, SwiftUI 3!", controlSize: .large),
    ]
    
    var body: some View {
        VStack {
            ForEach(items) {
                Button($0.name) {}
                .tint($0.color)
                .controlSize($0.controlSize)
            }
            .buttonStyle(.bordered)
            
            // iOS15 新增构造方法
            Button("New in SwiftUI 3", role: .destructive) {
            }
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_Button_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_Button()
    }
}
