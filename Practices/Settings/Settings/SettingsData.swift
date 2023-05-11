//
//  SettingsData.swift
//  Settings
//
//  Created by 蔡志文 on 5/4/23.
//

import SwiftUI

class SettingsData {
  static let datas: [SettingsSection] = [
    SettingsSection(
      items:
        [SettingsItem(image: "hourglass", color: Color.indigo, title: "屏幕使用时间")]
    ),

    SettingsSection(
      items:
        [
          SettingsItem(image: "gear", color: Color.gray, title: "通用"),
          SettingsItem(image: "figure.wave.circle", color: Color.blue, title: "辅助功能"),
          SettingsItem(image: "hand.raised.fill", color: Color.blue, title: "隐私与安全"),
        ]
    ),

    SettingsSection(
      items:
        [SettingsItem(image: "key.fill", color: Color.gray, title: "密码")]
    )
  ]
}

struct SettingsItem: Identifiable, Hashable {
  var id = UUID()
  let image: String
  let color: Color
  let title: String
}

struct SettingsSection: Identifiable {
  var id = UUID()
  var items: [SettingsItem]
}
