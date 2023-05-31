//
//  TImeLIneListCell.swift
//  ITime
//
//  Created by 蔡志文 on 5/24/23.
//

import SwiftUI

struct TimeLIneListCell: View {
  var body: some View {
    HStack {
      Text("00:00~05:24")
        .font(.caption2)
        .foregroundColor(Color.gray)
      Circle()
        .fill(Color.red)
        .frame(width: 15)
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

struct TImeLIneListCell_Previews: PreviewProvider {
    static var previews: some View {
        TimeLIneListCell()
    }
}
