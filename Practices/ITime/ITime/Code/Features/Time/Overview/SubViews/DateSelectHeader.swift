//
//  DateSelectHeader.swift
//  ITime
//
//  Created by 蔡志文 on 5/19/23.
//

import SwiftUI

struct DateSelectHeader: View {
  var transaction: Transaction = {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    return transaction
  }()

  @Binding var showCalendar: Bool
  let prefore: () -> Void
  let after: () -> Void
  init(showCalendar: Binding<Bool>, prefore: @escaping () -> Void, after: @escaping () -> Void) {
    self._showCalendar = showCalendar
    self.prefore = prefore
    self.after = after
  }

  var body: some View {
    HStack {
      Button("前一天") {
        prefore()
      }
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
      Button("后一天") {
        after()
      }
    }
    .frame(height: 35)
    .padding(.horizontal)
    .foregroundColor(Color.gray)
    .font(.caption)
  }
}

struct DateSelectHeader_Previews: PreviewProvider {
  static var previews: some View {
    DateSelectHeader(showCalendar: .constant(false), prefore: {}, after: {})
  }
}
