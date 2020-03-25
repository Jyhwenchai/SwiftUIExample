//
//  SU_TransformedShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TransformedShape: View {
    var body: some View {
        TransformedShape(shape: Rectangle(), transform: CGAffineTransform(scaleX: 0.5, y: 0.5))
            .fill(Color.blue)
            .frame(width: 200, height: 200)
    }
}

struct SU_TransformedShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_TransformedShape()
    }
}
