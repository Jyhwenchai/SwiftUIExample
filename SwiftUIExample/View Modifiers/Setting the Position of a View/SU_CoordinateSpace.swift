//
//  SU_CoordinateSpace.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/17.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 我们可以使用 `coordinateSpace` 为一个视图所在的坐标空间取一个名字，在其它地方的视图可以根据
 `public func frame(in coordinateSpace: CoordinateSpace) -> CGRect` 方法转换坐标为 `coordinateSpace` 标记的视图所在的坐标空间的值
 
 */
struct SU_CoordinateSpace: View {

    var body: some View {
        Text("见 SU_GeometryReader.swift 示例")
    }
}

struct SU_CoordinateSpace_Previews: PreviewProvider {
    static var previews: some View {
        SU_CoordinateSpace()
    }
}
