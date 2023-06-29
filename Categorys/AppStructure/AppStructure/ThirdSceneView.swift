//
//  ThirdSceneView.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct ThirdSceneView: View {
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    VStack {
      Text("Third Scene View")
      Button("Dismiss") {
        dismiss()
      }
    }
  }
}

#Preview {
  ThirdSceneView()
}
