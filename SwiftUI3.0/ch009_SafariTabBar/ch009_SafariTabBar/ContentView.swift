//
//  ContentView.swift
//  ch009_SafariTabBar
//
//  Created by 蔡志文 on 2022/5/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Home(proxy: proxy)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
