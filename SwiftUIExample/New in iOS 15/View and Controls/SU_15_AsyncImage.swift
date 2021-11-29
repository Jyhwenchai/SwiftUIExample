//
//  SU_AsyncImage.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/23.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_15_AsyncImage: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                // init(url:scale:)
                HStack {
                    AsyncImage(url: URL(string: "https://picsum.photos/150/150"), scale: 0.75)
                        .frame(maxWidth: 200, maxHeight: 200)
                }
                HStack {
                    AsyncImage(url: URL(string: "https://picsum.photos/150/150")) { phase in
                        if let image = phase.image {
                            image
                        } else if phase.error != nil {
                            Color.red
                        } else {
                            Color.blue
                        }
                    }
                    .frame(width: 150, height: 150, alignment: .center)
                    
                    // init(url:scale:content:placeholder:)
                    AsyncImage(url: URL(string: "https://picsum.photos/150/150")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 150, height: 150, alignment: .center)
   
                }
                HStack {
                    // init(url:scale:transaction:content:)
                    AsyncImage(url: URL(string: "https://picsum.photos/150/150"), scale: 0.75, transaction: Transaction(animation: .linear)) { phase in
                        if let image = phase.image {
                            image
                        } else {
                            Color.gray
                        }
                    }
                    .frame(maxWidth: 200, maxHeight: 200)
                }
                
            }
        }
        else {
            // Fallback on earlier versions
        }
    }
}

struct SU_AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_AsyncImage()
    }
}
