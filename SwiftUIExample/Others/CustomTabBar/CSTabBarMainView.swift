//
//  CustomTabBarMainView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSTabBarMainView: View {
    
    @State private var currentTab: TabTag = .home
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                CSTabSegmentView(currentTab: $currentTab)
                CSTabBar(currentTab: $currentTab, showModal: $showModal)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$showModal) { CSModalView() }
    }
}

struct CustomTabBarMainView_Previews: PreviewProvider {
    static var previews: some View {
        CSTabBarMainView()
    }
}
