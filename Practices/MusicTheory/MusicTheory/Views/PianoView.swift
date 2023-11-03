//
//  Test.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/23/23.
//

import SwiftUI

@Observable
class NoteSettings {
  let whiteSize: CGSize = .init(width: 14, height: 80)
  let blackSize: CGSize = .init(width: 10, height: 55)
}

struct PianoView: View {
  @State private var settings = NoteSettings()
  var body: some View {
    VStack {
      HStack(spacing: 0) {
        Text("H")
        Text("2")
          .font(.system(size: 16))
          .baselineOffset(6)
        Text("O")
      }
      .font(.system(size: 18))
      HStack(spacing: 0) {
        PianoKeyBoardGroupView(group: .largeGroup2)
          .environment(settings)
        PianoKeyBoardGroupView(group: .largeGroup1)
          .environment(settings)
        PianoKeyBoardGroupView(group: .largeGroup)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup1)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup2)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup3)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup4)
          .environment(settings)
        PianoKeyBoardGroupView(group: .smallGroup5)
          .environment(settings)
          .border(width: 1, edges: [.trailing], color: Color.black)
      }
    }
  }
}

struct PianoKeyBoardGroupView: View {
  @Environment(NoteSettings.self) private var settings
  var whiteBars: [KeyBoardBarModel]
  var blackBars: [KeyBoardBarModel]
  var group: NoteGroup
  init(group: NoteGroup) {
    self.group = group
    switch group {
    case .largeGroup2:
      whiteBars = [
        KeyBoardBarModel(name: "A", barType: .white),
        KeyBoardBarModel(name: "B", barType: .white)
      ]

      blackBars = [
        KeyBoardBarModel(name: "A#", barType: .black),
      ]
    case .smallGroup5:

      whiteBars = [
        KeyBoardBarModel(name: "C", barType: .white),
      ]
      blackBars = []
    default:
      whiteBars = [
        KeyBoardBarModel(name: "C", barType: .white),
        KeyBoardBarModel(name: "D", barType: .white),
        KeyBoardBarModel(name: "E", barType: .white),
        KeyBoardBarModel(name: "F", barType: .white),
        KeyBoardBarModel(name: "G", barType: .white),
        KeyBoardBarModel(name: "A", barType: .white),
        KeyBoardBarModel(name: "B", barType: .white)
      ]

      blackBars = [
        KeyBoardBarModel(name: "C#", barType: .black),
        KeyBoardBarModel(name: "D#", barType: .black),
        KeyBoardBarModel(name: "F#", barType: .black),
        KeyBoardBarModel(name: "G#", barType: .black),
        KeyBoardBarModel(name: "A#", barType: .black),
      ]
    }
  }

  @State var clickBar: KeyBoardBarModel?

  var body: some View {
    VStack {
      ZStack(alignment: .top) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(whiteBars) { bar in
            PianoKeyboardBarItem(model: bar)
              .frame(width: settings.whiteSize.width, height: settings.whiteSize.height)
              .overlay(keyboardColor(bar))
              .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                  .onChanged{ value in
                    if clickBar == nil {
                      clickBar = bar
                    }
                  }
                  .onEnded { _ in
                    clickBar = nil
                  }
              )
          }
        }

        HStack(alignment: .top, spacing: 0) {
          ForEach(blackBars) { bar in
            let offsetX = blackBarOffset(bar)
            PianoKeyboardBarItem(model: bar)
              .frame(width: settings.blackSize.width, height: settings.blackSize.height)
              .overlay(keyboardColor(bar))
              .offset(x: offsetX)
              .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                  .onChanged{ value in
                    if clickBar == nil {
                      clickBar = bar
                    }
                  }
                  .onEnded { _ in
                    clickBar = nil
                  }
              )
          }
        }
      }
    }
  }

  func blackBarOffset(_ bar: KeyBoardBarModel) -> CGFloat {
    let whiteWidth = settings.whiteSize.width
    let blackWidth = settings.blackSize.width
    let diff = whiteWidth - blackWidth
    let baseOffset = (2 * whiteWidth - blackWidth) / 2.0
    let start: CGFloat = (7 * whiteWidth - 5 * blackWidth) / 2.0

    if group == .largeGroup2 {
      return 0
    }

    switch bar.name {
    case "C#": return -start + baseOffset
    case "D#": return -start + baseOffset + diff
    case "F#": return -start + baseOffset + whiteWidth + 2 * diff
    case "G#": return -start + baseOffset + whiteWidth + 3 * diff
    case "A#": return -start + baseOffset + whiteWidth + 4 * diff
    default: return 0
    }
  }

  func keyboardColor(_ keyboard: KeyBoardBarModel) -> Color {
    if let clickBar, clickBar.id == keyboard.id {
      Color.blue
    } else {
      Color.clear
    }
  }
}

struct PianoKeyboardBarItem: View {
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
  PianoView()
}


