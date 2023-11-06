//
//  Test.swift
//  MusicTheory
//
//  Created by 蔡志文 on 11/2/23.
//

import SwiftUI

struct Test: View {
  @State var randomNote = randomNoteCharacter()
  var body: some View {
    VStack {
      HStack {
        Text("低半音：\(randomNote.lowSemitone.description)")
        Spacer()
        Text("高半音：\(randomNote.highSemitone.description)")
      }
      .font(.system(size: 40))

      Text(randomNote.description)
        .font(.system(size: 60))
      Button {
        randomNote = randomNoteCharacter()
      } label: {
        Text("random")
      }

      HStack {
        Text("低全音：\(randomNote.lowWholeSemitone.description)")
        Spacer()
        Text("高半音：\(randomNote.highWholeSemitone.description)")
      }
      .font(.system(size: 40))
    }
  }
}

#Preview {
  Test()
}
