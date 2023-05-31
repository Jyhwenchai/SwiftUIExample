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

struct TimeTab: Identifiable, Hashable, Equatable {
  var id = UUID()
  let page: Page
  let title: String
  var minX: CGFloat = 0
  var width: CGFloat = 0
  var positionX: CGFloat = 0
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

enum TimeMenu: String, Identifiable, CaseIterable {
  var id: Self { self }
  case shareBeauty = "分享(精美)"
  case shareWhite = "分享(白底)"
  case treasureBox = "宝盒"
  case daily = "日报"
  case search = "搜索"
}
 
