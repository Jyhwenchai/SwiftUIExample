//
//  SU_Equatable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI


/**
 当我们想忽略数据中的某些更改，这正是我们可以使用 `EquatableView` 或 `.equatable()` 。
 
 使用 `.equatable()` 与 `EquatableView` 两者本质上没有区别
 
 > 可以在预览编辑器中 debug 模式下查看打印的结果与 `SU_Equatable_Normal.swift` 中没有优化前做对比
 */

struct SU_Equatable: View {
    @State private var n = 3
    
    var body: some View {
        
        VStack {
            
//            EquatableView(content: NumberParity(number: n))
            NumberParity(number: n).equatable()
            Button("New Random Number") {
                self.n = Int.random(in: 1...1000)
            }.padding(.top, 80)
            
            Text("\(n)")
        }
    }
    

    struct NumberParity: View, Equatable {
        let number: Int
        @State private var flag = false
        
        var body: some View {
            let animation = Animation.linear(duration: 3.0).repeatForever(autoreverses: false)
            
            print("Body computed for number = \(number)")
            
            return VStack {
                if number.isOdd {
                    Text("ODD")
                } else {
                    Text("EVEN")
                }
            }
            .foregroundColor(.white)
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 10).fill(self.number.isOdd ? Color.red : Color.green))
            .rotationEffect(self.flag ? Angle(degrees: 0) : Angle(degrees: 360))
            .onAppear { withAnimation(animation) { self.flag.toggle() } }
        }
        
        static func == (lhs: NumberParity, rhs: NumberParity) -> Bool {
            return lhs.number.isOdd == rhs.number.isOdd
        }
    }
}

struct SU_Equatable_Previews: PreviewProvider {
    static var previews: some View {
        SU_Equatable()
    }
}
