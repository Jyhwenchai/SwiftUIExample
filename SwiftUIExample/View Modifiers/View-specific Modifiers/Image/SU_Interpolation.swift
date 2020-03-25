//
//  SU_Interpolation.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func interpolation(_ interpolation: Image.Interpolation) -> Image`
 
 参见文章：
 https://www.hackingwithswift.com/books/ios-swiftui/controlling-image-interpolation-in-swiftui
 */
struct SU_Interpolation: View {
    var body: some View {
        //  仔细观察颜色的边缘：它们看起来参差不齐，同时很模糊。锯齿状的部分来自原始图像，因为它的大小仅为69x98像素，所以模糊的部分是 SwiftUI 尝试在拉伸像素时对其进行融合以使拉伸不那么明显的地方。
        // 通常，这种混合效果很好，但是在这里却很难解决，因为源图片很小（因此需要以我们想要的大小显示很多混合图像），因为图像中有很多纯色，因此混合像素显得突出很明显。
        
//        Image("alienBeige_swim1")
//            .resizable()
//            .scaledToFit()
//            .frame(maxHeight: .infinity)
//            .background(Color.black)
//            .edgesIgnoringSafeArea(.all)
        
        // 在这里我们可以使用 .none。这会完全关闭图像插值，不应用混合像素，使其具有锐利的边缘
        
        Image("alienBeige_swim1")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SU_Interpolation_Previews: PreviewProvider {
    static var previews: some View {
        SU_Interpolation()
    }
}
