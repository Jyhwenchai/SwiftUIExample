//
//  NavigationPathView'.swift
//  Navigation
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

/// [关联 Session] (https://developer.apple.com/documentation/swiftui/bringing_robust_navigation_structure_to_your_swiftui_app)
/// [Session Code](https://developer.apple.com/documentation/swiftui/bringing_robust_navigation_structure_to_your_swiftui_app)
/// 使用 `NavigationPath` 来管理视图层级的跳转需要配合 `navigationDestination` 修改器进行使用
/// `NavigationPath` 可以接受符合 `Codable` 协议的类型做为导航路径的序列号表示，然后通过 `navigationDestination`
/// 可以接收到传递值在要呈现的页面中进行传递该值
struct NavigationPathView: View {
    var body: some View {
      TabView {
        NavigationPathExample1()
          .tabItem { Text("First") }
        NavigationPathExample2()
          .tabItem { Text("Second") }
        NavigationPathExample3()
          .tabItem { Text("Third") }
      }
    }
}

struct Odd: Identifiable, Hashable, Codable {
  var id = UUID()
  let content: String
}

struct Even: Identifiable, Hashable, Codable {
  var id = UUID()
  let content: String
}

struct NavigationPathExample1: View {
  @State private var path = NavigationPath()

  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(0..<3, id: \.self) { index in
          Section {
            ForEach(0..<6, id: \.self) { index in
              HStack {
                Text("Cell \(index)")
                Spacer()
                Button("view cell detail") {
                  if index % 2 == 0 {
                   let content = "even cell detail page: \(index)"
                    path.append(Even(content: content))
                  } else {
                   let content = "odd cell detail page: \(index)"
                    path.append(Odd(content: content))
                  }
                }
              }
            }
          } header: {
            HStack {
              Text("Header \(index)")
              Spacer()
              Button("view header detail") {
                path.append("header Detail page: \(index)")
              }
            }
          }
        }

      }
      .navigationTitle("NavigationPath")
      .navigationDestination(for: String.self) { value in
        Text(value)
      }
      .navigationDestination(for: Odd.self) { value in
        Text(value.content)
      }
      .navigationDestination(for: Even.self) { value in
        Text(value.content)
      }
    }
  }
}

struct NavigationPathExample2: View {
  @State private var showDetails = false

  var body: some View {
    NavigationStack {
      VStack {
        Button("Show details") {
          showDetails = true
        }
      }
      .navigationDestination(isPresented: $showDetails) {
        Text("Detail")
      }
      .navigationTitle("NavigationPath")
    }
  }
}

struct NavigationPathExample3: View {
  @State private var colorShown: Color?

  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Mint", value: Color.mint)
        NavigationLink("Pink", value: Color.pink)
        NavigationLink("Teal", value: Color.teal)
      }
      .navigationTitle("NavigationPath")
      .navigationDestination(item: $colorShown) { color in
        Circle()
          .fill(color)
          .frame(width: 100)
      }
    }
  }
}

#Preview {
    NavigationPathView()
}
