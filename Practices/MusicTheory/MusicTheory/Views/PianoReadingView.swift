//
//  PianoReadingView.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/20/23.
//

import SwiftUI

struct PianoReadingView: View {
  var body: some View {
    HStack(spacing: 0) {
      PianoKeyBoardView(barClip: .left)
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView()
      PianoKeyBoardView(barClip: .right)
        .border(width: 1, edges: [.trailing], color: Color.black)
    }
  }
}


private let totalBarItem: [KeyBoardBarModel] = [
  KeyBoardBarModel(name: "C", barType: .white),
  KeyBoardBarModel(name: "D", barType: .white),
  KeyBoardBarModel(name: "E", barType: .white),
  KeyBoardBarModel(name: "F", barType: .white),
  KeyBoardBarModel(name: "G", barType: .white),
  KeyBoardBarModel(name: "A", barType: .white),
  KeyBoardBarModel(name: "B", barType: .white),
  KeyBoardBarModel(name: "C#", barType: .black),
  KeyBoardBarModel(name: "D#", barType: .black),
  KeyBoardBarModel(name: "F#", barType: .black),
  KeyBoardBarModel(name: "G#", barType: .black),
  KeyBoardBarModel(name: "A#", barType: .black),
]

struct PianoKeyBoardView: View {

  var bars: [KeyBoardBarModel]
  var barClip: BarClip
  init(barClip: BarClip = .none) {
    self.barClip = barClip
    let notes = barClip.showNotes.map { $0.rawValue }
    bars = totalBarItem.filter {
      notes.contains($0.name)
    }
  }

  @State var clickBar: KeyBoardBarModel?

  var body: some View {
    VStack {
      HStack(alignment: .top, spacing: 0) {
        ForEach(0..<bars.count, id: \.self) { index in
          let bar = bars[index]
          let size = bar.barType == .black ?
          CGSize(width: 10, height: 40.0) :
          CGSize(width: 12, height: 60)

          let offsetX = calculateBarOffsetXByIndex(index)
          PianoKeyboardBar(model: bar)
            .frame(width: size.width, height: size.height)
            .overlay(keyboardColor(bar))
            .offset(x: offsetX)
            .simultaneousGesture(
              DragGesture(minimumDistance: 0)
                .onChanged{ value in
                  if clickBar == nil {
                    clickBar = bars[index]
                  }
                }
                .onEnded { _ in
                  clickBar = nil
                }
            )
        }
      }
      .offset(x: barOffset())
      .frame(width:  barWidth())
      .clipped()
    }
  }

  func barWidth() -> CGFloat {
    switch barClip {
    case .none: return 7 * 12
    case .left: return 2 * 12
    case .right: return 12
    }
  }

  func barOffset() -> CGFloat {
    switch barClip {
    case .none: 25
    case .left: 5
    case .right: 0
    }
  }

  func calculateBarOffsetXByIndex(_ index: Int) -> CGFloat {
    var offsetX: CGFloat
    switch barClip {
    case .none:
      if index < 7 {
        offsetX = 0
      } else {
        let blackIndex = index - 7
        let leading = 7.0 * 12.0 + CGFloat(blackIndex) * 10.0
        offsetX = (12.0 - 5.0) + CGFloat(blackIndex < 2 ? blackIndex : blackIndex + 1) * 12.0 - leading
      }
    case .left:
      if index < 2 {
        offsetX = 0
      } else {
        offsetX = -(12.0 + 5)
      }
    case .right:
      offsetX = 0
    }
    return offsetX
  }

  func keyboardColor(_ keyboard: KeyBoardBarModel) -> Color {
    if let clickBar, clickBar.id == keyboard.id {
      Color.blue
    } else {
      Color.clear
    }
  }
}


struct PianoKeyboardBar: View {
  let model: KeyBoardBarModel
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundStyle(model.color)
        .border(width: 1, edges: [.top, .leading, .bottom], color: .black)
    }
  }
}



#Preview {
  PianoReadingView()
}
