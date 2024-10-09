//
//  PopoverExample.swift
//  NewTabView
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

struct PopoverExample: View {
  @State private var showSheet = false

  var body: some View {
    Button {
      showSheet.toggle()
    } label: {
      Text("Show sheet")
    }
    .sheet(isPresented: $showSheet) {
      Text("This is a quick demo of presentation sizing.")
        .presentationSizing(.form)
    }
  }
}

#Preview {
  PopoverExample()
}
