//
//  TipCard.swift
//  ParallaxCarousel
//
//  Created by 蔡志文 on 8/25/23.
//

import SwiftUI

struct TripCard: Identifiable, Hashable {
  var id: UUID = .init()
  var title: String
  var subTitle: String
  var image: String
}

var tripCards: [TripCard] = [
  .init(title: "London", subTitle: "England", image: "img1"),
  .init(title: "New York", subTitle: "USA", image: "img2"),
  .init(title: "Prague", subTitle: "Czech Republic", image: "img3")
]
