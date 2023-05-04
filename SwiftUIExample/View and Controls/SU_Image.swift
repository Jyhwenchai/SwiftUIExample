//
//  SU_Image.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Image: View {
    var body: some View {
        Image(systemName: "airplayvideo")
            .resizable()    // 设置 resizable 后可以调整图片的大小
            .aspectRatio(contentMode: .fit)
            .scaleEffect(1)
            .frame(width: 200, height: 200, alignment: .center)
            .foregroundColor(Color.orange)
            .background(Color.blue)
    }
}

struct SU_Image_Previews: PreviewProvider {
    static var previews: some View {
        SU_Image()
    }
}
