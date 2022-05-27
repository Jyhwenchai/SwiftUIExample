//
//  Home.swift
//  ch010_3DCarouselSlider
//
//  Created by 蔡志文 on 2022/5/20.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "p1"
    
    var body: some View {
        ZStack {
            // Geometry Reader for getting Screen size
            GeometryReader { proxy in
                let size = proxy.size
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
                
            }
            .ignoresSafeArea()
            // Material Effect
            .overlay(.ultraThinMaterial)
            .preferredColorScheme(.dark)
            
            // Carousel List
            TabView(selection: $currentTab) {
                // Since were having 7 images
                ForEach(1...7, id: \.self) { index in
                    
                   // CarouseBody View
                    CarouseBodyView(index: index)
                }
            }
            // Page tab style
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
