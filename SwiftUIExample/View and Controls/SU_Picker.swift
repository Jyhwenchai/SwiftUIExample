//
//  SU_Picker.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Picker: View {
    var numbers = ["One", "Two", "Three"]
    @State private var selectedIndex = 1
    var body: some View {
        VStack {
            // `init(selection:content:label:)`
            Picker(selection: $selectedIndex, label: Text("Number")) {
                ForEach(0 ..< numbers.count) {
                    Text(self.numbers[$0])
                }
            }
            
            Text("You selected: \(numbers[selectedIndex])")
            
            // `init(_:selection:content:)`
            Picker("Number", selection: $selectedIndex) {
                 ForEach(0 ..< numbers.count) {
                    Text(self.numbers[$0])
                }
            }
            .pickerStyle(.segmented)
            
        }
    }
}

struct SU_Picker_Previews: PreviewProvider {
    static var previews: some View {
        SU_Picker()
    }
}
