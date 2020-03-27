//
//  SU_SettingViewSize.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_SettingViewSize: View {
    
    @State var leftViewWidth: CGFloat = 100
    @State var rightViewWidth: CGFloat = 100
    
    var body: some View {
        VStack(spacing: 10) {
            frame1()
            frame2()
            fixedSizeExample()
        }
    }
    
    /**
     `func frame(width: CGFloat? = nil,
                height: CGFloat? = nil,
             alignment: Alignment = .center) -> some View`
     */
    func frame1() -> some View {
        AnyView(Text("Hello, World!"))
            .frame(width: 200, height: 200, alignment: .leading)
            .background(Color.blue)
    }
    
    // 观察当第二个文本所能被压缩的最小宽度及拉伸后的最大宽度
    func frame2() -> some View {
        VStack {
            HStack(spacing: 0) {
                Text("left fix text") // 修改 width 观察效果
                    .frame(width: leftViewWidth, height: 100, alignment: .center)
                
                Text("Hello, World! Hello, World!")
                    .frame(minWidth: 30, idealWidth: 50, maxWidth: 200, maxHeight: 100, alignment: .leading)
                    .background(Color.red)
                
                Text("right fix Text") // 修改 width 观察效果
                    .frame(width: rightViewWidth, height: 100, alignment: .center)
            }
            .frame(width: 300, height: 100, alignment: .center)
            .background(Color.yellow)
            
            Slider(value: $leftViewWidth, in: 0...150, minimumValueLabel: Text("10"), maximumValueLabel: Text("150")) {
                Text("")
            }
            Slider(value: $rightViewWidth, in: 0...150, minimumValueLabel: Text("10"), maximumValueLabel: Text("150")) {
                Text("")
            }
        }
    }
    
    func fixedSizeExample() -> some View {
        Text("Hello, World! Hello, World!, Hello, World! Hello, World! Hello, World! Hello, World! Hello, World! Hello, World!")
            .fixedSize()  // 取消注释对比效果
            .border(Color.red)
            .frame(width: 200, height: 100, alignment: .center)
            .border(Color.green)
    }
}

struct SU_SettingViewSize_Previews: PreviewProvider {
    static var previews: some View {
        SU_SettingViewSize()
    }
}
