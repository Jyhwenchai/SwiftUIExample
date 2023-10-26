//
//  RollCallPractiseView.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/20/23.
//

import SwiftUI

struct RollCallPractiseView: View {
  @State private var randomAlphabet: String = ""
  var body: some View {
    VStack {
      Button("Random Note🎶") {
        randomAlphabet = randomMusicalAlphabet()
      }
      Divider()
      Text(randomAlphabet)
        .font(.title)
        .bold()
    }
    .padding()
  }

  func randomMusicalAlphabet() -> String {
    let times = 40
    let result = (0..<times).reduce(String()) { partialResult, _ in
      let ch = Int.random(in: 1...7)
      return partialResult + "\(ch)"
    }
    return result
  }
}

#Preview {
  RollCallPractiseView()
}
