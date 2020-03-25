//
//  SU_DatePicker.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_DatePicker: View {
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    @State private var date = Date()
    
    var body: some View {
        VStack {
//            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
//                Text("Select a date")
//            }
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .hourAndMinute) {
                Text("Date is \(date, formatter: dateFormatter)")
            }

        }
    }
}

struct SU_DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SU_DatePicker()
    }
}
