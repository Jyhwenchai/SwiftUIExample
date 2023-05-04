//
//  SU_sheet.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_sheet: View {
  @State var showActionSheet = false
  var body: some View {
    Button(action: {
      self.showActionSheet = true
    }) {
      Text("show alert")
    }
    .sheet(isPresented: $showActionSheet) {
      Text("Modal View")
      Button("Dismiss") {
        self.showActionSheet = false
      }
    }
  }
}

struct SU_sheet_Previews: PreviewProvider {
  static var previews: some View {
    SU_sheet()
  }
}
