//
//  Tag.swift
//  TagTextField
//
//  Created by 蔡志文 on 11/15/23.
//

import Foundation

struct Tag: Identifiable, Hashable {
  var id: UUID = .init()
  var value: String
  var isInitial: Bool = false
}
