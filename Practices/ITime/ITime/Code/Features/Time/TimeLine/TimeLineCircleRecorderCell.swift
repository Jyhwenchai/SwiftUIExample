//
//  CircleRecorderCell.swift
//  ITime
//
//  Created by 蔡志文 on 5/23/23.
//

import SwiftUI

struct TimeLineCircleRecorderCell: View {
    var body: some View {
      HStack {
       Text("00:00~05:24")
          .font(.caption2)
          .foregroundColor(Color.gray)
        CircleRecorder(ringWidth: 4, maxRingRadius: 16, circleRadius: 6, hiddenIndicator: true)
        Text("睡觉")
          .font(.caption)
          .foregroundColor(Color.black)
        Text("5小时24分钟")
          .font(.caption2)
          .foregroundColor(Color.gray.opacity(0.7))
        Spacer()
        Image(systemName: "chevron.right")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 6)
          .foregroundColor(Color.gray)
      }
    }
}

struct CircleRecorderCell_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineCircleRecorderCell()
    }
}
