//
//  OverviewCalendar.swift
//  ITime
//
//  Created by 蔡志文 on 5/12/23.
//

import SwiftUI

struct OverviewCalendar: View {
  
  @State private var calendarOpacity: Double = 0
  @Binding var selectedDate: Date
  @Binding var isShow: Bool
  var transaction: Transaction = {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    return transaction
  }()

  var body: some View {
    ZStack {
      Color.black.opacity(calendarOpacity)
        .ignoresSafeArea()
        .animation(.linear(duration: 0.15), value: calendarOpacity)
        .onTapGesture {
          calendarOpacity = 0
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withTransaction(transaction) {
              isShow = false
            }
          }
        }
      VStack(spacing: 0) {
        let startDate = Date(timeIntervalSince1970: 0)
        let endDate = Date()
        Text("选择日期")
          .frame(maxWidth: .infinity, maxHeight: 25)
          .background(Color("dark_blue"))
          .font(.caption)
          .foregroundColor(Color.white)
        HStack {
          VStack(alignment: .leading) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: selectedDate)
            let dateFormatter: DateFormatter = {
              let format = DateFormatter()
              format.dateFormat = "MM-dd"
              return format
            }()
            let monthDay = dateFormatter.string(from: selectedDate)
            let weekday = calendar.component(.weekday, from: selectedDate)
            let weekdayString = calendar.weekdaySymbols[weekday-1]

            Text("\(year)")
              .foregroundColor(Color.white.opacity(0.6))
            Text(monthDay + weekdayString)
              .font(.largeTitle)
              .foregroundColor(Color.white.opacity(0.8))
          }
          Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 16)
        .background(Color("medium_blue"))
        DatePicker("date", selection: $selectedDate, in: startDate...endDate, displayedComponents: [.date])
          .datePickerStyle(.graphical)
          .background(Color.white)
          .tint(Color("medium_blue"))
      }
      .background(Color.white)
      .cornerRadius(10)
      .padding(.horizontal, 35)
    }
    .onAppear {
      calendarOpacity = 0.5
    }
  }
}

struct OverviewCalendar_Previews: PreviewProvider {
  static var previews: some View {
    OverviewCalendar(selectedDate: .constant(Date()), isShow: .constant(false))
  }
}
