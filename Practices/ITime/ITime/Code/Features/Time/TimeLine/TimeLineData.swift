//
//  TimeLineData.swift
//  ITime
//
//  Created by 蔡志文 on 5/24/23.
//

import Foundation

enum TimeLineStyle: Identifiable, CaseIterable {
  var id: Self { self }
  case circle
  case list

  var description: String {
    switch self {
    case .circle: return "圆形"
    case .list: return "列表"
    }
  }
}
