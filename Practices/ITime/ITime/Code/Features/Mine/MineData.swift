//
//  MineData.swift
//  ITime
//
//  Created by 蔡志文 on 5/25/23.
//

import SwiftUI

enum MineData {

  static let featureItems: [MineGridItem] = [
    .init(image: "ic_white_backup64x64", backgroundColor: Color.random, text: "数据备份"),
    .init(image: "ic_fun_decode64x64", backgroundColor: Color.random, text: "密码保护"),
    .init(image: "ic_change_color44x44", backgroundColor: Color.clear, text: "换肤"),
    .init(image: "ic_white_today66x64", backgroundColor: Color.random, text: "宝盒"),
    .init(image: "ic_white_mcard64x64", backgroundColor: Color.random, text: "发现")
  ]

  static let otherItems: [MineGridItem] = [
    .init(image: "ic_white_book64x64", backgroundColor: Color.random, text: "教程"),
    .init(image: "ic_white_like64x64", backgroundColor: Color.random, text: "好评"),
    .init(image: "ic_white_share64x64", backgroundColor: Color.random, text: "分享"),
  ]

}


struct MineGridItem: Identifiable {
  var id = UUID()
  let image: String
  let backgroundColor: Color
  let text: String
}
