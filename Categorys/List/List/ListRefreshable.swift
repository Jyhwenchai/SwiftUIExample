//
//  ListRefreshable.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListRefreshable: View {
    var body: some View {
      List {
        ForEach(0..<10, id: \.self) { index in
          Text("Row:\(index)")
        }
      }
      .refreshable {
        try? await Task.sleep(nanoseconds: 2 * 1000000000)
      }
    }
}

#Preview {
    ListRefreshable()
}
