//
//  Task.swift
//  DragDropLists
//
//  Created by 蔡志文 on 7/27/23.
//

import SwiftUI

struct Task: Identifiable, Hashable {
  var id: UUID = .init()
  var title: String
  var status: Status
}

enum Status {
  case toto
  case working
  case completed
}

