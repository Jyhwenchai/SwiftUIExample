//
//  SU_GeometryReader.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `GeometryReader`
 
 一个容器视图，可以根据其自身大小和坐标空间定义其内容。
 
 更多的信息可以查看这篇文章
 https://swiftui-lab.com/geometryreader-to-the-rescue/
 */
struct SU_GeometryReader: View {

    var innerView: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        // text 相对于各个视图的位置信息
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
    
    var outerView: some View {
        VStack {
            Text("Top")
            innerView
                .background(Color.green)
            Text("Bottom")
        }
        .background(Color.red)
        .coordinateSpace(name: "Custom")
    }
    
    var body: some View {
         outerView
    }
}


struct SU_GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        SU_GeometryReader()
    }
}
