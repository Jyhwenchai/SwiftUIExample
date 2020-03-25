//
//  SU_NavigationBarTitle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_NavigationBarTitle: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                }
                .navigationBarTitle("List One")
            }
            .tabItem {
                Text("Tab One")
            }
            
            NavigationView {
                List {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                }
                .navigationBarTitle("List Two", displayMode: .inline)
            }
            .tabItem {
                Text("Tab Two")
            }
        }
    }
}

struct SU_NavigationBarTitle_Previews: PreviewProvider {
    static var previews: some View {
        SU_NavigationBarTitle()
    }
}
