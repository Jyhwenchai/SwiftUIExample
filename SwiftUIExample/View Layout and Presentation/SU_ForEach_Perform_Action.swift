//
//  SU_ForEach_Perform_Action.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers

struct SU_ForEach_Perform_Action: View {

  @State var datas = [String]()

  private var addButton: some View {
    AnyView(Button(action: addItem) {
      Image(systemName: "plus")
    })
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(datas, id: \.self) {
          Text($0)
        }
        .onDelete(perform: removeRows)
        // 在 ipad 上有效
        //                .onInsert(of: [String(kUTTypeURL)], perform: insertRows)
        // iOS 15 +
        .onInsert(of: [UTType.url], perform: insertRows)
        .onMove(perform: moveRows)
      }
      .navigationBarTitle("ForEach Example")
      .navigationBarItems(leading: EditButton(), trailing: addButton)

    }
  }



  func removeRows(atOffsets: IndexSet) {
    datas.remove(atOffsets: atOffsets)
  }

  func insertRows(at offset: Int, itemProvider: [NSItemProvider]) {
    for provider in itemProvider {
      print(provider)
      if provider.canLoadObject(ofClass: URL.self) {
        _ = provider.loadObject(ofClass: URL.self) { url, error in
          DispatchQueue.main.async {
            url.map {
              self.datas.insert($0.absoluteString, at: offset)
              print($0)
            }
          }
        }
      }
    }
  }

  func moveRows(fromOffsets source: IndexSet, toOffset destination: Int) {
    datas.move(fromOffsets: source, toOffset: destination)
  }

  func addItem() {
    datas.append("Row \(datas.count + 1)")
  }

}
struct SU_ForEach_Perform_Action_Previews: PreviewProvider {
  static var previews: some View {
    SU_ForEach_Perform_Action()
  }
}
