//
//  SU_DisclosureGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_DisclosureGroup: View {
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    
    var body: some View {
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
            Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
            DisclosureGroup("Sub-items") {
                Text("Sub-item 1")
            }
        }
        .padding(.all, 10)
    }
}

struct SU_DisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_DisclosureGroup()
    }
}
