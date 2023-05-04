//
//  SU_Toggle.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Toggle: View {
  @State var isOpen: Bool = false

  struct Animal: Hashable {
    let name: String
    let image: String
    var isFavorite: Bool = false
  }

  @State var isOn: Bool = true

  let animals = [
    Animal(name: "Dog", image: "🐶"),
    Animal(name: "Cat", image: "🐱"),
    Animal(name: "Panda", image: "🐼"),
    Animal(name: "Lion", image: "🦁")
  ]


    var body: some View {
        VStack {
            Toggle(isOn: $isOpen) {
                Text(isOpen ? "open" : "close")
            }
            .fixedSize()
            .toggleStyle(.switch)
            .labelsHidden()
            
            Toggle("\(isOpen ? "open" : "close")", isOn: $isOpen)
                .fixedSize()

//          List {
//            ForEach(animals, id: \.self) { animal in
//              Toggle(
//                animal.name,
//                sources: animals,
//                isOn: \.isFavorite
//              )
//            }
//          }
        }
    }
}

struct SU_Toggle_Previews: PreviewProvider {
    static var previews: some View {
        SU_Toggle()
    }
}
