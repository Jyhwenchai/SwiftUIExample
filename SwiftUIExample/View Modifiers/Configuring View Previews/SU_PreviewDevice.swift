//
//  SU_PreviewDevice.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func previewDevice(_ value: PreviewDevice?) -> some View`
 
 可以使用此修改器切换预览设备
 
 支持一下值：
 
```
 "Mac"
 "iPhone 7"
 "iPhone 7 Plus"
 "iPhone 8"
 "iPhone 8 Plus"
 "iPhone SE"
 "iPhone X"
 "iPhone Xs"
 "iPhone Xs Max"
 "iPhone Xʀ"
 "iPad mini 4"
 "iPad Air 2"
 "iPad Pro (9.7-inch)"
 "iPad Pro (12.9-inch)"
 "iPad (5th generation)"
 "iPad Pro (12.9-inch) (2nd generation)"
 "iPad Pro (10.5-inch)"
 "iPad (6th generation)"
 "iPad Pro (11-inch)"
 "iPad Pro (12.9-inch) (3rd generation)"
 "iPad mini (5th generation)"
 "iPad Air (3rd generation)"
 "Apple TV"
 "Apple TV 4K"
 "Apple TV 4K (at 1080p)"
 "Apple Watch Series 2 - 38mm"
 "Apple Watch Series 2 - 42mm"
 "Apple Watch Series 3 - 38mm"
 "Apple Watch Series 3 - 42mm"
 "Apple Watch Series 4 - 40mm"
 "Apple Watch Series 4 - 44mm"
 
 使用命令 xcrun simctl list devicetypes 可列出上述设备
```
 */
struct SU_PreviewDevice: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct SU_PreviewDevice_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           SU_PreviewDevice()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")

           SU_PreviewDevice()
              .previewDevice(PreviewDevice(rawValue: "iPad Air (3rd generation)"))
              .previewDisplayName("iPad Air (3rd generation)")
        }
    }
}
