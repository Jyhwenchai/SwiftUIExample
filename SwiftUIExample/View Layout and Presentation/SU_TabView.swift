//
//  SU_TabView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TabView: View {
    
    @State var selectIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectIndex) {
            NavigationView {
                List(0..<100) {
                    Text("List One # Row \($0)")
                }
                .navigationBarTitle("List One")
            }.tabItem {
                Image(systemName: "message.fill")
                Text("TabOne")
            }.tag(0)
            
            NavigationView {
                List(0..<100) {
                    Text("List Two # Row \($0)")
                }
                .navigationBarTitle("List Two")
            }.tabItem {
                Image(systemName: "bolt.horizontal.icloud.fill")
                Text("TabTwo")
            }.tag(1)
            
            NavigationView {
                List(0..<100) {
                    Text("List Three # Row \($0)")
                }
                .navigationBarTitle("List Three")
            }.tabItem {
                Image(systemName: "safari.fill")
                Text("TabThree")
            }.tag(2)
            
            Text("The Last Tab")
                .tabItem {
                    Text("Select Page: \(self.selectIndex)")
                }
        }
    }
}

struct SU_TabView_Previews: PreviewProvider {
    static var previews: some View {
        SU_TabView()
    }
}
