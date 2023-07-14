//
//  Model.swift
//  MaterialCarousel
//
//  Created by 蔡志文 on 7/14/23.
//

import SwiftUI

struct Card: Identifiable, Hashable, Equatable {
  let id: UUID = .init()
  var image: String
  var previousOffset: CGFloat = 0
}
