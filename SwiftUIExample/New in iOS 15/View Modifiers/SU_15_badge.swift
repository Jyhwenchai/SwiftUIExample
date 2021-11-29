//
//  SU_15_badge.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/25.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SU_15_badge: View {
    var body: some View {
        TabView {
            Text("The First Tab")
                .badge(10)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .badge(Text("abc"))
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

@available(iOS 15.0.0, *)
struct SU_15_badge_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_badge()
    }
}
