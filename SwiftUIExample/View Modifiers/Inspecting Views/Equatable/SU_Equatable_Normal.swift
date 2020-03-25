//
//  SU_Equatable_Normal.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

extension Int {
    var isEven: Bool { return self % 2 == 0 }
    var isOdd: Bool { return self % 2 != 0 }
}

/**
 
 未进行任何处理版本
 
 */

struct SU_Equatable_Normal: View {
     @State private var n = 3
       
       var body: some View {
           
           VStack {
               NumberParity(number: n)
               
               Button("New Random Number") {
                   self.n = Int.random(in: 1...1000)
               }.padding(.top, 80)
               
               Text("\(n)")
           }
       }
       

       struct NumberParity: View {
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
       }
}

struct SU_Equatable_Normal_Previews: PreviewProvider {
    static var previews: some View {
        SU_Equatable_Normal()
    }
}
