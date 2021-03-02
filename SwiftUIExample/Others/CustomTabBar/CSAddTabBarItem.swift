//
//  CSAddTabBarItem.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSAddTabBarItem: View {
    let radius: CGFloat
    let action: () -> Void

    public init(radius: CGFloat, action: @escaping () -> Void) {
        self.radius = radius
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing:0) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: radius, height: radius, alignment: .center)
                .foregroundColor(Color(.systemBlue))
                .background(Color(.white))
                .cornerRadius(radius/2)
                .overlay(RoundedRectangle(cornerRadius: radius/2).stroke(Color(.blue), lineWidth: 2))

        }
        .frame(width: radius, height: radius)
        .onTapGesture(perform: action)
    }
}

struct CSAddTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        CSAddTabBarItem(radius: 55) {}
    }
}
