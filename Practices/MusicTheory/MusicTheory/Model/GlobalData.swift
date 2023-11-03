//
//  GlobalData.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/23/23.
//

import SwiftUI

struct MusicTheory: Identifiable {
  var id = UUID()
  let title: String
  let view: AnyView
  init(title: String, view: some View) {
    self.title = title
    self.view = AnyView(view)
  }
}

let musicTheoryList: [MusicTheory] = [
  .init(title: "Note name practice", view: RollCallPractiseView()),
  .init(title: "Piano Keybard", view: PianoView()),
]

// note/ # b 
