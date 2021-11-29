//
//  SU_LIst.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_List: View {
    let datas = Array(1...100)
    @State var selectSet: Set<Int> = Set()
    
    var body: some View {
        NavigationView {
//            listInit_1()
            listInit_2()
//            listInit_3()
        }
    }
    
    // 使用 Button 处理点击事件
    func listInit_1() -> some View {
        List(0..<100) { row in
            Button(action: {
                print("click row \(row)")
            }) {
                Text("row \(row)")
            }
        }
        .navigationBarTitle("List")
    }
    
    func listInit_2() -> some View {
        List(datas, id: \.self, selection: $selectSet) { row in
            Text("row \(row)")
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle(Text("Select Row Count \(selectSet.count)"))
    }
    
    func listInit_3() -> some View {
        List {
            ForEach(datas, id: \.self) { value in
                Text("Row \(value)")
            }
        }
        .navigationBarTitle("List")
    }
    
}

struct SU_List_Previews: PreviewProvider {
    static var previews: some View {
        SU_List()
    }
}
