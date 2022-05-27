//
//  CH001_Badge.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_Badge: View {
    
    @State var heartbadgeSeen = false
    
    var body: some View {
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Color.green
                .onAppear(perform: {
                    heartbadgeSeen = true
                })
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                }
                .badge(heartbadgeSeen ? 0 : 20)
            Color.yellow
            .tabItem {
                    Image(systemName: "gearshape")
                }
        }
    }
}

struct CH001_Badge_Previews: PreviewProvider {
    static var previews: some View {
        CH001_Badge()
    }
}
