//
//  Piano.swift
//  MusicTheory
//
//  Created by 蔡志文 on 11/1/23.
//

import SwiftUI

struct KeyBoardBarModel: Identifiable {
  var id = UUID()
  let name: String
  var barType: BarType

  enum BarType: Int {
    case black
    case white
  }

  var color: Color {
    switch barType {
    case .black: Color.black
    case .white: Color.white
    }
  }
}

enum BarClip {
  case none
  case left
  case right

  var showNotes: [Note] {
    switch self {
    case .none: Note.allCases
    case .left: [.A, .ASharp, .B]
    case .right: [.C]
    }
  }
}

enum NoteGroup {
  case largeGroup2
  case largeGroup1
  case largeGroup
  case smallGroup
  case smallGroup1
  case smallGroup2
  case smallGroup3
  case smallGroup4
  case smallGroup5
}

struct NoteBarModel: Identifiable {
  var id = UUID()
  let name: String
  let note: Note
}

enum Note: String, CaseIterable {
  case C
  case D
  case E
  case F
  case G
  case A
  case B
  case CSharp = "C#"
  case DSharp = "D#"
  case FSharp = "F#"
  case GSharp = "G#"
  case ASharp = "A#"
}

enum BaseNote: String, CaseIterable {
  case C
  case D
  case E
  case F
  case G
  case A
  case B
}

/// 音符记号
enum NoteMark: String, CaseIterable {
  case sharp = "\u{266F}" // ♯
  case flat = "\u{266D}"  // ♭
  case natural = "\u{266E}" // ♮
  case doubleFlat = "\u{1D12B}" // 𝄫
  case doublesharp = "\u{1D12A}" // 𝄪
}

/// 音符角标（组号）
enum NoteScrip: String, CaseIterable {
  case sup0 = "\u{2070}"
  case sup1 = "\u{00B9}"
  case sup2 = "\u{00B2}"
  case sup3 = "\u{00B3}"
  case sup4 = "\u{2074}"
  case sup5 = "\u{2075}"
  case sup6 = "\u{2076}"
  case sup7 = "\u{2077}"
  case sup8 = "\u{2078}"
  case sup9 = "\u{2079}"
  case sub0 = "\u{2080}"
  case sub1 = "\u{2081}"
  case sub2 = "\u{2082}"
  case sub3 = "\u{2083}"
  case sub4 = "\u{2084}"
  case sub5 = "\u{2085}"
  case sub6 = "\u{2086}"
  case sub7 = "\u{2087}"
  case sub8 = "\u{2088}"
  case sub9 = "\u{2089}"


  func reduce() -> NoteScrip {
    switch self {
    case .sup1: .sup2
    case .sup0: .sup1
    case .sub0: .sup0
    case .sub1: .sub0
    case .sub2: .sub1
    case .sub3: .sub2
    case .sub4: .sub3
    case .sub5: .sub4
    default: fatalError("该组已无法减小")
    }
  }

  func increase() -> NoteScrip {
    switch self {
    case .sup2: .sup1
    case .sup1: .sup0
    case .sup0: .sub0
    case .sub0: .sub1
    case .sub1: .sub2
    case .sub2: .sub3
    case .sub3: .sub4
    case .sub4: .sub5
    default: fatalError("该组已无法增大")
    }
  }
}

struct NoteCharacter: CustomStringConvertible {
  var note: BaseNote
  var sign: NoteMark?
  var scrip: NoteScrip
  var isLargerGroup: Bool {
    switch scrip {
    case .sup0, .sup1, .sup2: return true
    default: return false
    }
  }

  var description: String {
    var result = ""
    if let sign { result += sign.rawValue }
    result += isLargerGroup ? note.rawValue.uppercased() : note.rawValue.lowercased()
    switch scrip {
    case .sub0, .sup0: break
    default: result += scrip.rawValue
    }
    return result
  }
}

extension BaseNote {
  init?(intValue: Int) {
    switch intValue {
    case 1: self = .C
    case 2: self = .D
    case 3: self = .E
    case 4: self = .F
    case 5: self = .G
    case 6: self = .A
    case 7: self = .B
    default: return nil
    }
  }

  var intValue: Int {
    switch self {
    case .C: 1
    case .D: 2
    case .E: 3
    case .F: 4
    case .G: 5
    case .A: 6
    case .B: 7
    }
  }


  var leftNote: BaseNote {
    switch self {
    case .C: .B
    case .D: .C
    case .E: .D
    case .F: .E
    case .G: .F
    case .A: .G
    case .B: .A
    }
  }

  var rightNote: BaseNote {
    switch self {
    case .C: .D
    case .D: .E
    case .E: .F
    case .F: .G
    case .G: .A
    case .A: .B
    case .B: .C
    }
  }
}

extension NoteCharacter {
  var lowSemitone: NoteCharacter {
    var noteCharacter = self
    switch note {
    case .A, .B, .D, .E, .G:
      if let sign {
        switch sign {
        case .sharp:
          noteCharacter.sign = .none
        case .flat:
          noteCharacter.note = noteCharacter.note.leftNote
          noteCharacter.sign = .none
        default: break
        }
      } else {
        noteCharacter.note = noteCharacter.note.leftNote
        noteCharacter.sign = .sharp
      }
    case .C, .F:
      if let sign {
        switch sign {
        case .sharp:
          noteCharacter.sign = .none
        case .flat:
          noteCharacter.note = noteCharacter.note.leftNote
          noteCharacter.sign = .flat
          noteCharacter.scrip = noteCharacter.scrip.reduce()
        default: break
        }
      } else {
        noteCharacter.note = noteCharacter.note.leftNote
        if .C == note {
          noteCharacter.scrip = noteCharacter.scrip.reduce()
        }
      }
    }
    return noteCharacter
  }

  var highSemitone: NoteCharacter {
    var noteCharacter = self
    switch note {
    case .C, .D, .F, .G, .A:
      if let sign {
        switch sign {
        case .sharp:
          noteCharacter.note = noteCharacter.note.rightNote
          noteCharacter.sign = .none
        case .flat:
          noteCharacter.sign = .none
        default: break
        }
      } else {
        noteCharacter.sign = .sharp
      }
    case .E, .B:
      if let sign {
        switch sign {
        case .sharp:
          noteCharacter.note = noteCharacter.note.rightNote
          noteCharacter.scrip = noteCharacter.scrip.increase()
          noteCharacter.sign = .sharp
        case .flat:
          noteCharacter.sign = .none
        default: break
        }
      } else {
        noteCharacter.note = noteCharacter.note.rightNote
        if .B == note {
          noteCharacter.scrip = noteCharacter.scrip.increase()
        }

      }
    }
    return noteCharacter
  }

  var lowWholeSemitone: NoteCharacter {
    var noteCharacter = self
    switch note {
    case .D, .E, .G, .A, .B:
      noteCharacter.note = noteCharacter.note.leftNote
    case .C, .F:
      if let sign = noteCharacter.sign {
        switch sign {
        case .flat:
          noteCharacter.note = noteCharacter.note.leftNote.leftNote
        case .sharp:
          noteCharacter.note = noteCharacter.note.leftNote
        default: break
        }
        if note == .C {
          noteCharacter.scrip = noteCharacter.scrip.reduce()
        }
        noteCharacter.sign = .none
      } else {
        noteCharacter.sign = .flat
        noteCharacter.scrip = noteCharacter.scrip.reduce()
      }
    }
    return noteCharacter
  }

  var highWholeSemitone: NoteCharacter {
    var noteCharacter = self
    switch note {
    case .C, .D, .F, .G, .A:
      noteCharacter.note = noteCharacter.note.rightNote
    case .E, .B:
      if let sign = noteCharacter.sign {
        switch sign {
        case .sharp:
          noteCharacter.note = noteCharacter.note.rightNote.rightNote
        case .flat:
          noteCharacter.note = noteCharacter.note.rightNote
        default: break
        }
        if note == .B {
          noteCharacter.scrip = noteCharacter.scrip.increase()
        }
        noteCharacter.sign = .none
      } else {
        noteCharacter.note = noteCharacter.note.rightNote
        noteCharacter.sign = .sharp
      }
    }
    return noteCharacter
  }
}

func randomNoteCharacter() -> NoteCharacter {
  let note = BaseNote.allCases.randomElement()!

  // 是否为大字组
  let isLargerGroup = Bool.random()

  var scrips: [NoteScrip] = []
  if isLargerGroup {
    scrips = [.sup1, .sup0]
  } else {
    scrips = [.sub0, .sub1, .sub2, .sub3, .sub4]
  }

  let scrip: NoteScrip = scrips.randomElement()!
  let sign: NoteMark = [NoteMark.flat, NoteMark.sharp].randomElement()!

  return NoteCharacter(note: note, sign: sign, scrip: scrip)
}
