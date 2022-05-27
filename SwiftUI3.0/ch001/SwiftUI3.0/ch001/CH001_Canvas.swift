//
//  Ch001_GraphiicsContext.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_Canvas: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                context.draw(Text("Hello"), at: CGPoint(x: size.width / 2, y: size.height / 2))
                context.draw(Image(systemName: "house.fill"), at: CGPoint(x: size.width / 1.8, y: size.height / 1.5))
            }
            .frame(width: 300, height: 300)
            .background(Color.green, in: RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct Ch001_GraphiicsCanvas_Previews: PreviewProvider {
    static var previews: some View {
        CH001_Canvas()
    }
}
