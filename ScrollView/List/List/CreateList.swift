//
//  CreateList.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct CreateList: View {
    var body: some View {
      TabView {
        List {
          ForEach(0..<20, id: \.self) { index in
            Text("ForEach index:\(index)")
          }
        }
        .tabItem { Text("ForEach") }

        List(0..<20) { index in
          Text("index:\(index)")
        }
        .tabItem { Text("ForEach") }
      }
    }
}

#Preview {
    CreateList()
}
