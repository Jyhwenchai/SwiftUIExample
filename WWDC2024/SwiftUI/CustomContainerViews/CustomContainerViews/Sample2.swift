//
//  Sample2.swift
//  CustomContainerViews
//
//  Created by 蔡志文 on 6/18/24.
//

import SwiftUI

struct Sample2: View {
  var body: some View {
    NavigationStack {
      List {
        CustomView2 {
          ForEach(0...10, id: \.self) { index in
            Section {
              ForEach(0...5, id: \.self) { item in
                HStack {
                  Spacer()
                  Text("section: \(index) row: \(item)")
                  Spacer()
                }
              }
            } header: {
              HStack {
                Text("Header \(index)")
                Spacer()
              }
            } footer: {
              HStack {
                Spacer()
                Text("Footer \(index)")
              }
            }
          }
        }
      }
      .navigationTitle("Custom ContainerView")
    }
  }
}

struct CustomView2<Content: View>: View {
  @ViewBuilder var content: Content
  var body: some View {
    VStack(spacing: 10) {
      Group(sectionsOf: content) { sections in
        ForEach(sections) { section in
          Section {
            ForEach(section.content) { subView in
              subView
            }
            //            section.content
          } header: {
            section.header
          } footer: {
            section.footer
          }
        }
      }
    }
  }
}

#Preview {
    Sample2()
}
