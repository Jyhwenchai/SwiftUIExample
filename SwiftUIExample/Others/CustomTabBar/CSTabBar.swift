//
//  TabBar.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSTabBar: View {
    @Binding var currentTab: TabTag
    @Binding var showModal: Bool
    
    var body: some View {
        HStack {
            CSTabBarItem(selectedTag: $currentTab, imageName: "list.bullet", paddingEdges: .leading, tag: .home)
            CSAddTabBarItem(radius: 55) {
                showModal.toggle()
            }
            CSTabBarItem(selectedTag: $currentTab, imageName: "gear", paddingEdges: .leading, tag: .mine)
        }
        .frame(minHeight: 64)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        CSTabBar(currentTab: .constant(.home), showModal: .constant(false))
    }
}
