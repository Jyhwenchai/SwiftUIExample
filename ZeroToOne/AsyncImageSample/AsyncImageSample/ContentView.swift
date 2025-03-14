//
//  ContentView.swift
//  AsyncImageSample
//
//  Created by 蔡志文 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
  let url: URL? = URL(string: "https://picsum.photos/300/200")
  var body: some View {
    Form {
      AsyncImage(url: url)
      AsyncImage(url: url, scale: 1.5)
      AsyncImage(url: url) { image in
        image
      } placeholder: {
        ProgressView()
      }
      AsyncImage(url: url, scale: 1, transaction: .init(animation: .easeIn)) { phase in
        switch phase {
        case .empty:
          Text("loading...")
        case .success(let image):
          image
            .resizable()
            .frame(width: 120, height: 80)
        case .failure(let error):
          Text("loading failed: \(error.localizedDescription)")
        default: Text("known")
        }
      }
      ImageReaderView()
    }
  }
}

#Preview {
  ContentView()
}

struct ImageReaderView: View {
  let playerName = "tclark3"
  let achievementDate = Date()
  @State private var achievementImage: CGImage?
  var body: some View {
    let trophyAndDate = createAwardView(forUser: playerName,
                                        date: achievementDate)
    HStack {
      VStack {
        trophyAndDate
        Button("Save Achievement") {
          let renderer = ImageRenderer(content: trophyAndDate)
          if let image = renderer.cgImage {
            achievementImage = image
          }
        }
      }
      if let achievementImage {
        Image(uiImage: UIImage(cgImage: achievementImage))
          .background(Color.orange)
          .border(Color.red)
      }
    }
  }

  private func createAwardView(forUser: String, date: Date) -> some View {
    VStack {
      Image(systemName: "trophy")
        .resizable()
        .frame(width: 200, height: 200)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(color: .mint, radius: 5)
      Text(playerName)
        .font(.largeTitle)
      Text(achievementDate.formatted())
    }
    .multilineTextAlignment(.center)
    .frame(width: 200, height: 290)
  }
}
