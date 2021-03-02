//
//  TabBarItem.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSTabBarItem: View {
    
    @Binding var selectedTag: TabTag
    let imageName: String
    let paddingEdges: Edge.Set
    let tag: TabTag
    
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color(selectedTag == tag ? .blue : .white).opacity(0.2))
                .foregroundColor(Color(selectedTag == tag ? .blue : .black))
                .cornerRadius(6)
        }
        .frame(width: 100, height: 50)
        .onTapGesture { selectedTag = tag }
        .padding(paddingEdges, 15)
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        CSTabBarItem(selectedTag: .constant(.home), imageName: "gear", paddingEdges: .leading, tag: .home)
    }
}
