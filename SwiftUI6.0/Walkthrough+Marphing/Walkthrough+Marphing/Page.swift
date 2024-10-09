//
//  Page.swift
//  Walkthrough+Marphing
//
//  Created by 蔡志文 on 7/29/24.
//

import SwiftUI

enum Page: String, CaseIterable {
  case page1 = "playstation.logo"
  case page2 = "gamecontroller.fill"
  case page3 = "link.icloud.fill"
  case page4 = "text.bubble.fill"

  var title: String {
    switch self {
    case .page1: "Welcome to Playstation"
    case .page2: "DualSense® wireless controller"
    case .page3: "PlayStation@ Remote play"
    case .page4: "Connect With People"
    }
  }

  var subTitle: String {
    switch self {
    case .page1: "Your journey starts here"
    case .page2: "Discover a deeper gaming experience\nwith the DualSense@ controller"
    case .page3: "Stream your PS5m to Mac or\nApple devices."
    case .page4: "Reach out and make new friends"
    }
  }

  var index: CGFloat {
    switch self {
    case .page1: 0
    case .page2: 1
    case .page3: 2
    case .page4: 3
    }
  }

  var nextPage: Page {
    let index = Int(self.index) + 1
    if index < 4 {
      return Page.allCases[index]
    }
    return self
  }

  var previousPage: Page {
    let index = Int(self.index) - 1
    if index >= 0 {
      return Page.allCases[index]
    }
    return self

  }
}
