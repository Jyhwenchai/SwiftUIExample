//
//  TimeLineListStyle.swift
//  ITime
//
//  Created by 蔡志文 on 5/24/23.
//

import SwiftUI

struct TimeLineListStyle: View {
    var body: some View {
      List {
        ForEach(0..<10) { index in
          TimeLIneListCell()
            .listRowSeparator(.hidden)
        }
      }
      .listStyle(.plain)
    }
}

struct TimeLineListStyle_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineListStyle()
    }
}
