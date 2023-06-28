//
//  ListStyle.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListStyle_: View {
  enum Style: Int, Identifiable {
    case plain
    case grouped
    case inset
    case insetGrouped
    var id: Self { self }
  }

  @State var style: Style = .plain

  var body: some View {
    VStack {
      Picker("ListStyle", selection: $style) {
        Text("plain").tag(Style.plain)
        Text("grouped").tag(Style.grouped)
        Text("inset").tag(Style.inset)
        Text("insetGrouped").tag(Style.insetGrouped)
      }
      .pickerStyle(.segmented)
      let list = List {
        ForEach(0..<3, id: \.self) { index in
          Section {
            ForEach(0..<6, id: \.self) { index in
              Text("Row: \(index)")
            }
          } header: {
            Text("Header")
          } footer: {
            Text("Footer")
          }
        }
      }

      switch style {
      case .plain:
        list.listStyle(.plain)
      case .grouped:
        list.listStyle(.grouped)
      case .inset:
        list.listStyle(.inset)
      case .insetGrouped:
        list.listStyle(.insetGrouped)
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  ListStyle_()
}
