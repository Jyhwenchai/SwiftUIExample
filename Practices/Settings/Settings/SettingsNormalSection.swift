//
//  SettingsNormalItem.swift
//  Settings
//
//  Created by 蔡志文 on 5/4/23.
//

import SwiftUI

struct SettingsNormalSection: View {
  let section: SettingsSection

  var body: some View {
    Section(content: {
      ForEach(section.items) { item in
        NavigationLink {
          EmptyView()
        } label: {
          HStack {
            Image(systemName: item.image)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 30, height: 20, alignment: .center)
              .foregroundColor(.white)
              .padding(.vertical, 5)
              .background(item.color)
              .cornerRadius(6)
            Text(item.title)
          }
        }
      }
    }, footer: {
      EmptyView()
    })
  }
}

struct SettingsNormalSection_Previews: PreviewProvider {
    static var previews: some View {
      SettingsNormalSection(section: SettingsData.datas.first!)
    }
}
