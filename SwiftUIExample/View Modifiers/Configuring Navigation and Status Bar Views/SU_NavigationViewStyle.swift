//
//  SU_NavigationViewStyle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func navigationViewStyle<S>(_ style: S) -> some View where S : NavigationViewStyle`
 
 在 iOS 中定义了两个类型，可以切换至 iPad 设备查看它们的区别
 
 1. DefaultNavigationViewStyle （默认就是 DoubleColumnNavigationViewStyle）
 2. DoubleColumnNavigationViewStyle
 3. StackNavigationViewStyle
 */

struct SU_NavigationViewStyle: View {

    var people = ["Angela", "Juan", "Yeji"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people, id: \.self) { person in
                    NavigationLink(destination: Text("Hello!")) {
                        Text(person)
                    }
                }
            }
            Text("Default Text")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct SU_NavigationViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        SU_NavigationViewStyle()
    }
}
