//
//  SU_PickerStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 `func pickerStyle<S>(_ style: S) -> some View where S : PickerStyle`
 
 目前在 `iOS` 系统中我们只能使用 `SwiftUI` 提供的三种样式
 
 1.DefaultPickerStyle
 2.SegmentedPickerStyle
 3.WheelPickerStyle
 
 > 需要在 `NavigationView` 和 `Form` 中使用才能正确的显示不同的风格
 */
struct SU_PickerStyle: View {
    var numbers = ["One", "Two", "Three"]
    @State private var selectedIndex = 1
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedIndex, label: Text("Strength")) {
                        ForEach(0 ..< numbers.count) {
                            Text(self.numbers[$0])
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                
                Section {
                    Picker(selection: $selectedIndex, label: Text("Strength")) {
                        ForEach(0 ..< numbers.count) {
                            Text(self.numbers[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Picker(selection: $selectedIndex, label: Text("Strength")) {
                        ForEach(0 ..< numbers.count) {
                            Text(self.numbers[$0])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
            .navigationBarTitle("PickerStyle")
        }
    }
}

struct SU_PickerStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_PickerStyle()
    }
}
