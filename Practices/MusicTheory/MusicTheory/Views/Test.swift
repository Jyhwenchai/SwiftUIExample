//
//  Test.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/23/23.
//

import SwiftUI

struct Test: View {
    var body: some View {
      PianoKeyboard()
    }
}

#Preview {
    Test()
}

struct PianoKey: View {
    var isWhite: Bool
    var body: some View {
        let keyColor: Color = isWhite ? .white : .black
        let keyWidth: CGFloat = isWhite ? 30 : 20
        let keyHeight: CGFloat = isWhite ? 150 : 100

        return Rectangle()
            .fill(keyColor)
            .frame(width: keyWidth, height: keyHeight)
            .offset(y: isWhite ? 0 : -25)
            .border(Color.black, width: 1)
    }
}

struct PianoKeyboard: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<7) { _ in
                PianoKey(isWhite: true)
                PianoKey(isWhite: false)
                PianoKey(isWhite: true)
                PianoKey(isWhite: true)
                PianoKey(isWhite: false)
                PianoKey(isWhite: true)
                PianoKey(isWhite: true)
            }
        }
        .frame(width: 500, height: 60)
    }
}

