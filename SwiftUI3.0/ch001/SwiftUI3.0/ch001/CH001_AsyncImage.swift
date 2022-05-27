//
//  CH001_AsyncImage.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_AsyncImage: View {
    let url = URL(string: "https://t7.baidu.com/it/u=1732966997,2981886582&fm=193&f=GIF")!
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: url, scale: 1.0) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                        
                        // Blur Effects
                            .overlay(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    } else {
                       Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                }
            }
            .navigationTitle("Async Image")
        }
    }
}

struct CH001_AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CH001_AsyncImage()
    }
}
