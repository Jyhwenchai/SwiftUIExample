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
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    @State private var date = Date()
    
    var body: some View {
        VStack {
            // `init(selection:displayedComponents:label:)`
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .hourAndMinute) {
                Text("Date is \(date, formatter: dateFormatter)")
            }

            // `init(_:selection:displayedComponents:)`
            DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            
            // `init(_:selection:in:displayedComponents:)`
            DatePicker(
                    "Start Date",
                     selection: $date,
                     in: dateRange,
                     displayedComponents: [.date, .hourAndMinute]
                )
        }
    }
}

struct SU_DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SU_DatePicker()
    }
}
