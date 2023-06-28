//
//  ListSelectionDisabled.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListSelectionDisabled: View {
  @State var selection: Int? = 7
  var body: some View {
    List(selection: $selection) {
      ForEach(0..<20) { item in
        Text("Row:\(item)")
          .selectionDisabled(item == selection)
          .background(item == selection ? Color.accentColor : Color.white)
      }
    }
  }
}

#Preview {
  ListSelectionDisabled()
}
