//
//  SU_Animation.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/19.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func animation(_ animation: Animation?) -> some View`
 
 将给定的动画应用于视图中的所有可动画的值。
 
 在 SwiftUI 中几乎所有的属性都是可动画的，包括旋转、缩放、位移、透明度、圆角、颜色等等。你可以一一的进行尝试
 */
struct SU_Animation: View {

    var body: some View {
        NavigationView {
            List(animationRowData) { item in
                NavigationLink(item.title, destination: item.destination)
            }
            .navigationBarTitle("Animations")
        }
    }
}

struct SU_Animation_Previews: PreviewProvider {
    static var previews: some View {
        SU_Animation()
    }
}

struct AnimationRow: Identifiable {
    var id = UUID()
    var title: String
    var destination: AnyView
    
}

private let animationRowData = [
    AnimationRow(title: "Animation 01", destination: AnyView(SU_Animation_01())),
    AnimationRow(title: "Animation 02", destination: AnyView(SU_Animation_02())),
    AnimationRow(title: "Animation 03", destination: AnyView(SU_Animation_03()))
]
