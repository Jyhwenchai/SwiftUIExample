//
//  ContentView.swift
//  PickersSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
  case chocolate, vanilla, strawberry
  var id: Self { self }
}

enum Topping: String, CaseIterable, Identifiable {
  case nuts, cookies, blueberries
  var id: Self { self }
}

extension Flavor {
  var suggestedTopping: Topping {
    switch self {
    case .chocolate: return .nuts
    case .vanilla: return .cookies
    case .strawberry: return .blueberries
    }
  }
}

struct ContentView: View {
  @State private var selectedFlavor: Flavor = .chocolate
  @State private var suggestedTopping: Topping = .nuts

  var body: some View {
    Form {
      Picker("Flavor", selection: $selectedFlavor) {
        Text("Chocolate").tag(Flavor.chocolate)
        Text("Vanilla").tag(Flavor.vanilla)
        Text("Strawberry").tag(Flavor.strawberry)
      }
      // label
      Picker(selection: $selectedFlavor) {
        Text("Chocolate").tag(Flavor.chocolate)
        Text("Vanilla").tag(Flavor.vanilla)
        Text("Strawberry").tag(Flavor.strawberry)
      } label: {
        Text("Flavor")
        Text("Choose your favorite flavor")
      }

      VStack {
        Picker("Flavor", selection: $suggestedTopping) {
          ForEach(Flavor.allCases) { flavor in
            Text(flavor.rawValue.capitalized)
              .tag(flavor.suggestedTopping)
          }
        }
        HStack {
          Text("Suggested Topping")
          Spacer()
          Text(suggestedTopping.rawValue.capitalized)
            .foregroundStyle(.secondary)
        }
      }
      // Picker style
      Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
          Text(flavor.rawValue.capitalized)
        }
      }
      .pickerStyle(.segmented)

      Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
          Text(flavor.rawValue.capitalized)
        }
      }
      .pickerStyle(.inline)

      Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
          Text(flavor.rawValue.capitalized)
        }
      }
      .pickerStyle(.menu)

      Picker("Flavor", selection: $selectedFlavor) {
        ForEach(Flavor.allCases) { flavor in
          Text(flavor.rawValue.capitalized)
        }
      }
      .pickerStyle(.wheel)
    }
  }
}

#Preview {
  ContentView()
}
