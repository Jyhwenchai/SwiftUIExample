//
//  SU_Picker.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Picker: View {

  enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
  }

  @State private var selectedFlavor: Flavor = .chocolate

  var body: some View {
    VStack {
      // `init(selection:content:label:)`
      Picker(selection: $selectedFlavor, label: Text("Number")) {
        ForEach(Flavor.allCases) {
          Text($0.rawValue)
        }
      }

      Text("You selected: \(selectedFlavor.rawValue)")

      // `init(_:selection:content:)`
      Picker("Number", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) {
          Text($0.rawValue)
        }
      }
      .pickerStyle(.segmented)

      // wrap in list
      List {
        Picker("Flavor", selection: $selectedFlavor) {
          Text("Chocolate").tag(Flavor.chocolate)
          Text("Vanilla").tag(Flavor.vanilla)
          Text("Strawberry").tag(Flavor.strawberry)
        }
      }
    }
  }
}

struct SU_Picker_Previews: PreviewProvider {
  static var previews: some View {
        SU_Picker()
    }
}
