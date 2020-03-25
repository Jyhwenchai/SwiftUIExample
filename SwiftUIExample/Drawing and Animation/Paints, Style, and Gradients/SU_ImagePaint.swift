//
//  SU_ImagePaint.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_ImagePaint: View {
    let imagePaint = ImagePaint(image: Image("friend_icon_likes"))
    var body: some View {
        Text("Hello World!")
            .frame(width: 200, height: 200, alignment: .center)
        .border(imagePaint,width: 20)
    }
}

struct SU_ImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        SU_ImagePaint()
    }
}
