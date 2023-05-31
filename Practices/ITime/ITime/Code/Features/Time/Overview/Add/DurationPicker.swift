//
//  DurationPicker.swift
//  ITime
//
//  Created by 蔡志文 on 5/12/23.
//

import SwiftUI

struct DurationPicker: View {

  @State private var time: DailyTime = .today
  private var hours = [Int](0...24)
  private var minites = [Int](0..<60)

  @State private var selectionHour: Int = 0
  @State private var selectionMinite: Int = 0

  private let width: CGFloat
  init(width: CGFloat) {
    self.width = width
    print("width: \(width)")
  }

//  @State private var selectionIndex: Int = 0
  @State private var selectionIndex: Int = 0

  var body: some View {
    VStack(spacing: 0) {
      SegmentedView(color: .white, selectedColor: Color("medium_blue"), selectedIndex: $selectionIndex) {
        Text(DailyTime.today.rawValue)
        Text(DailyTime.yestoday.rawValue)
      }
      .font(Font.caption)
      .frame(height: 26)

      HStack(spacing: 5) {
        Spacer()
        HStack(spacing: 0) {
          Picker(selection: $selectionHour) {
            ForEach(hours, id: \.self) { hour in
              Text(String(format: "%02d", hour)).tag(hour)
                .font(Font.callout)
            }
          } label: {}
            .frame(width: 60)
            .pickerStyle(.wheel)
            .background(.clear)
            .offset(x: 10)
          Text("时")
            .font(Font.callout)
            .frame(width: 40, height: 32)
//            .background(Color(red: 235 / 255.0, green: 235 / 255.0, blue: 236 / 255.0))
            .cornerRadius(8)
            .offset(x: -10)
        }
        .frame(width: width * 0.5, height: 110)

        HStack(spacing: 0) {
          Picker(selection: $selectionMinite) {
            ForEach(minites, id: \.self) { minite in
              Text(String(format: "%02d", minite)).tag(minite)
                .font(Font.callout)
            }
          } label: {}
            .frame(width: 60)
            .pickerStyle(.wheel)
            .background(.clear)
            .offset(x: 10)
          Text("分")
            .font(Font.callout)
            .frame(width: 40, height: 32)
//            .background(Color(red: 235 / 255.0, green: 235 / 255.0, blue: 236 / 255.0))
            .cornerRadius(8)
            .offset(x: -10)
        }
        .frame(width: width * 0.5, height: 110)
        Spacer()
      }
    }
  }
}


struct DurationPicker_Previews: PreviewProvider {
    static var previews: some View {
        DurationPicker(width: 100)
    }
}
