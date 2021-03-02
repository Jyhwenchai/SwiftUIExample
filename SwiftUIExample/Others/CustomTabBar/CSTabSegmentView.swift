//
//  CSTabSegmentView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSTabSegmentView: View {
    @Binding var currentTab: TabTag

    var body: some View {
        VStack {
            if currentTab == .home {
                CSHomeView()
            } else {
                CSMineView()
            }
        }
    }
}

struct CSTabSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        CSTabSegmentView(currentTab: .constant(.home))
    }
}
