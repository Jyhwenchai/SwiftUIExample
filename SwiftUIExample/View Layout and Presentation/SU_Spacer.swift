//
//  SU_Spacer.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 Spacer 用于占据视图布局中剩余空间的部分
 */
struct SU_Spacer: View {
    var body: some View {
        VStack {
            defaultLayout()
            usingSpacerLayout()
        }
    }
    
    func defaultLayout() -> some View {
        VStack {
            HStack {
                Image(systemName: "message.fill")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func usingSpacerLayout() -> some View {
        VStack {
            HStack {
                Image(systemName: "message.fill")
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
    }
}

struct SU_Spacer_Previews: PreviewProvider {
    static var previews: some View {
        SU_Spacer()
    }
}
