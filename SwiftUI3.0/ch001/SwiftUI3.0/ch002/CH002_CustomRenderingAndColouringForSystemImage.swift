//
//  CH002_CustomRenderingAndColouringForSystemImage.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_CustomRenderingAndColouringForSystemImage: View {
    var body: some View {
        VStack {
            Image(systemName: "brain.head.profile")
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.orange, .purple, .red)
            
            Image(systemName: "person")
                .font(.system(size: 55))
                .symbolVariant(.fill)
        }
    }
}

struct CH002_CustomRenderingAndColouringForSystemImage_Previews: PreviewProvider {
    static var previews: some View {
        CH002_CustomRenderingAndColouringForSystemImage()
    }
}
