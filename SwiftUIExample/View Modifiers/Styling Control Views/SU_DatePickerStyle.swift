//
//  SU_DatePickerStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func datePickerStyle<S>(_ style: S) -> some View where S : DatePickerStyle`
 
 目前 `SwiftUI` 没有提供自定义风格的方法，虽然提供了 `DatePickerStyle` 协议，但此协议没有提供任何可以实现的方法，仅仅由 `SwiftUI` 自身实现了两个样式，可以在示例中看出它们的区别
 
 1. `DefaultDatePickerStyle`
 2. `WheelDatePickerStyle`
 */
struct SU_DatePickerStyle: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @State private var date = Date()
    
    var body: some View {
        Form {
            Section {
                DatePicker(selection: $date, in: ...Date(), displayedComponents: .hourAndMinute) {
                    Text("Date is \(date, formatter: dateFormatter)")
                }
            }
            

            Section {
                DatePicker(selection: $date, in: ...Date(), displayedComponents: .hourAndMinute) {
                    Text("Date is \(date, formatter: dateFormatter)")
                }
                .datePickerStyle(WheelDatePickerStyle())
            }
        }
    }
}


struct SU_DatePickerStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_DatePickerStyle()
    }
}
