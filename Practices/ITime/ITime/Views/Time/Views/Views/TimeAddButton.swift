//
//  TimeAddButton.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct TimeAddButton: View {
  var body: some View {
    HStack {
      Button {
      } label: {
        Image(systemName: "plus")
          .resizable()
          .frame(width: 18, height: 18)
      }
      Spacer()
        .frame(width: 35)
      Button {
      } label: {
        Image(systemName: "clock")
          .resizable()
          .frame(width: 20, height: 20)
          .scaleEffect(CGSize(width: -1, height: 1))
      }
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .foregroundColor(.white)
    .background(
      Capsule()
        .fill(Color("medium_blue"))
    )
    .offset(y: -20)
  }
}

struct TimeAddButton_Previews: PreviewProvider {
    static var previews: some View {
        TimeAddButton()
    }
}
