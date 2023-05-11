//
//  Overview.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct Overview: View {
  @State private var isEmpty: Bool = false
  @State private var showCalendar: Bool = true
  @State private var selectedDate = Date()
  @State private var calendarOpacity: Double = 0
  @State private var coverOpacity: Double = 0

  var transaction: Transaction = {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    return transaction
  }()
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Button("前一天") {}
        Spacer()
        HStack {
          Button {
            withTransaction(transaction) {
              showCalendar = true
            }
          } label: {
            Text("今天")
              .foregroundColor(Color.black)
              .font(.body)
            Text("周三")
          }
        }
        Spacer()
        Button("后一天") {}
      }
      .frame(height: 35)
      .padding(.horizontal)
      .foregroundColor(Color.gray)
      .font(.caption)

      Divider()
        .opacity(0.5)

      VStack {
        if !isEmpty {
          OverviewList()
        } else {
          Spacer()
          CommonEmptyView()
          Spacer()
        }
      }
      .overlay(alignment: .bottom) {
        TimeAddButton()
      }
    }
    .fullScreenCover(isPresented: $showCalendar, content: {
      VStack {
        ZStack {
          Color.black.opacity(calendarOpacity)
            .ignoresSafeArea()
            .animation(.linear(duration: 0.15), value: calendarOpacity)
            .onTapGesture {
              calendarOpacity = 0
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withTransaction(transaction) {
                  showCalendar = false
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
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(TransparentBackground())
//      .animation(.easeIn(duration: 0.15), value: coverOpacity)
      .onAppear {
        calendarOpacity = 0.5
      }
    })
  }
}

struct Overview_Previews: PreviewProvider {
  static var previews: some View {
    Overview()
  }
}

struct TransparentBackground: UIViewRepresentable {
  private class BackgroundRemovalView: UIView {
    override func didMoveToWindow() {
      super.didMoveToWindow()
      superview?.superview?.backgroundColor = .clear
    }

  }

  func makeUIView(context: Context) -> UIView {
    return BackgroundRemovalView()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }
}
