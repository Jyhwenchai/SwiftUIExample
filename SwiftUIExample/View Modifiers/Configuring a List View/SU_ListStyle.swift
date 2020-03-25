//
//  SU_ListStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func listStyle<S>(_ style: S) -> some View where S : ListStyle`
 
 在 `iOS` 端就两种列表样式

 1. GroupedListStyle
 2. PlainListStyle
 
 */
struct SU_ListStyle: View {
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Plain")
            }
            .tabItem {
                Text("Plain")
            }
            
            
            NavigationView {
                List {
                    Section(header: Text("Group one")) {
                        ForEach(0..<10) {
                            Text("Row \($0)")
                        }
                    }
                    
                    
                    Section(header: Text("Group Two")) {
                        ForEach(0..<10) {
                            Text("Row \($0)")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Group")
            }
            .tabItem {
                Text("Group")
            }
        }
    }
}

struct SU_ListStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_ListStyle()
    }
}
