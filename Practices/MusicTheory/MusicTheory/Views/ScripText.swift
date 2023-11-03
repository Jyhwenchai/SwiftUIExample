//
//  ScripText.swift
//  MusicTheory
//
//  Created by 蔡志文 on 11/2/23.
//

import SwiftUI

struct ScripText: View {
    var body: some View {
      VStack {
        HStack {
          Image(systemName: "textformat.superscript")
            .font(.system(size: 26))
            .foregroundStyle(.black)
          HStack(spacing: 0) {
            Text("♯A♭")
            Text("\u{266D}")
          }
          .font(.system(size: 26))

          Image(systemName: "textformat.superscript")
            .font(.system(size: 36))
            .foregroundStyle(.black)
        }
        .border(Color.red, width: 1)
      }
    }
}

#Preview {
    ScripText()
}
