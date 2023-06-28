//
//  HStackLayout_.swift
//  CustomLayout
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct AnyLayout_: View {
  @State var toggleLayout: Bool = false
  var body: some View {
    let layout = toggleLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
    VStack {
      Toggle(isOn: $toggleLayout) {
        Text("Toggle Layout")
      }
      layout {
        Text("First label")
        Text("Second label")
      }
    }
  }
}

#Preview {
  AnyLayout_()
}
