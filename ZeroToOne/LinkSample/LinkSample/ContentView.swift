//
//  ContentView.swift
//  LinkSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form {
      Section("Link") {
        Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
          .environment(\.openURL, OpenURLAction { url in
            print("Open \(url)")
            return .handled
          })
      }

      Section("Share Link") {
        ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
          Label("Share", systemImage: "swift")
        }

        let photo: Photo = .init(image: Image(systemName: "swift"), caption: "Swift")
        ShareLink(
          item: photo,
          preview: SharePreview(
            photo.caption,
            image: photo.image))
      }
    }
  }
}

#Preview {
  ContentView()
}

struct Photo: Transferable {
  static var transferRepresentation: some TransferRepresentation {
    ProxyRepresentation(exporting: \.image)
  }

  public var image: Image
  public var caption: String
}

