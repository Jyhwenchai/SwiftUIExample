//
//  WindowSharedModel.swift
//  TabBarSheet
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

@Observable
class WindowSharedModel {
  var activeTab: Tab = .devices
}


enum Tab: String, CaseIterable {
  case people = "figure.2.arms.open"
  case devices = "macbook.and.iphone"
  case items = "circle.grid.2x2.fill"
  case me = "person.circle.fill"

  var title: String {
    switch self {
    case .people:
      "People"
    case .devices:
      "Devices"
    case .items:
      "Items"
    case .me:
      "Me"
    }
  }
}
