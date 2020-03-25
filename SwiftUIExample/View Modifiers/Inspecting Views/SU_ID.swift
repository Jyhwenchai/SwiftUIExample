//
//  SU_ID.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func id<ID>(_ id: ID) -> some View where ID : Hashable`
 
 这里举例使用次修改前进行
 1. 状态重置
 2. 观察如何触发过渡以添加或删除旧的过程
 3. 对列表的性能优化
 
 > 例子来源 https://swiftui-lab.com/swiftui-id/
 */
struct SU_ID: View {
    @State private var theId = 0
    
    var body: some View {
        TabView {
            
            ID_Example_Reset()
                .tabItem { Text("Example Reset") }
            
            
            ID_Example_Transitions()
                .tabItem { Text("Example Transitions") }
            
            
            ID_Example_List()
                .tabItem { Text("Example List") }
        }
    }
}

struct SU_ID_Previews: PreviewProvider {
    static var previews: some View {
        SU_ID()
    }
}


// Example Resetting State Values
struct ID_Example_Reset: View {
    @State private var theId = 0
    
    var body: some View {
        VStack {
            ExampleView().id(theId)
            Button("Reset") { self.theId += 1 }
        }
    }
}


struct ExampleView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var website = ""

    var body: some View {
        Form {
            TextField("Enter firstname", text: self.$firstname)
            TextField("Enter lastname", text: self.$lastname)
            TextField("Enter email address", text: self.$email)
            TextField("Enter website address", text: self.$website)
        }
    }
}


// Example Transitions
struct ID_Example_Transitions: View {
    
    @State private var theId = 0
    
    var body: some View {
        VStack(spacing: 20) {
            MyCircle()
                .transition(AnyTransition.opacity.combined(with: .slide))
                .id(theId)
            
            Text("id = \(theId)    ")
            
            Button("Increment Id") {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.theId += 1
                }
            }
        }
    }
}

struct MyCircle: View {
    private let color: Color = [.red, .green, .blue, .purple, .orange, .pink, .yellow].randomElement()!
    
    var body: some View {
        return Circle()
            .foregroundColor(color)
            .frame(width: 180, height: 180)
    }
}


// Example List
extension String {
    static func random(length: Int = 20) -> String {
        String((0..<length).map { _ in "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".randomElement()! })
    }
}

struct ID_Example_List: View {
    @State private var theId = 0
    @State private var array = (0..<500).map { _ in String.random() }

    var body: some View {
        HStack {
            ListNoID()
            
            ListUsingID()
        }
    }
}

struct ListNoID: View {
    @State private var array = (0..<500).map { _ in String.random() }
    var body: some View {
        VStack {
            List(array, id: \.self) { item in
                Text("\(item)")
            }

            Button("No id Shuffle") {
                self.array.shuffle()
            }
        }
    }
}

struct ListUsingID: View {
    @State private var theId = 0
    @State private var array = (0..<500).map { _ in String.random() }
    
    var body: some View {
        VStack {
            List(array, id: \.self) { item in
                Text("\(item)")
            }.id(theId)

            Button("using id Shuffle") {
                self.array.shuffle()
                self.theId += 1
            }
        }
    }
}
