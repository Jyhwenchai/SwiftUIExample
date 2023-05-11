//
//  TimeData.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import Foundation

class TimeData {
  static let tabs: [TimeTab] = [
    TimeTab(page: .overview, title: "概览"),
    TimeTab(page: .timeline, title: "时间轴"),
    TimeTab(page: .statistics, title: "统计"),
  ]
}

struct TimeTab: Identifiable, Hashable {
  var id = UUID()
  let page: Page
  let title: String
  var minX: CGFloat = 0
  var width: CGFloat = 0
  enum Page {
    case overview
    case timeline
    case statistics
  }

  init(id: UUID = UUID(), page: Page, title: String) {
    self.id = id
    self.page = page
    self.title = title
  }
}
