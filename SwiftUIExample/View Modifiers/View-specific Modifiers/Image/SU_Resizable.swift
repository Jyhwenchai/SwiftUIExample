//
//  SU_Resizable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/25.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image`
 
 有时候我们需要重置图片的尺寸，那么为了使设置的尺寸生效，可以使用此修改器
 
 对于 `capInsets` 与 `resizingMode` 参数 如果在大图像视图中使用小图像，则可以根据需要拉伸图像以使其适合，但看起来可能不太好。 iOS 提供了另一种方法，称为可调整大小的图像，您可以在其中将图像的一部分定义为固定大小，然后让 iOS 拉伸其余部分。

 这种技术在按钮图形中很常见：先将角固定大小，然后将中心部分拉伸到所需的大小。中心部分的大小应该仅为一个像素乘以一个像素，这样它才能完美地伸展，但是如果您要的话，您也可以要求 iOS 将中心区域作为图块重复。
 */
struct SU_Resizable: View {
    var body: some View {
        VStack(spacing: 100) {
            HStack(spacing: 60) {
                Image("1")
                    .frame(width: 80, height: 80)
                
                Image("1")
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            
            VStack(spacing: 20) {
                // 原图的大小为 50 * 50，我们设置不拉伸的区域为左上角 24 * 24、右上角24 * 24、左下角24 * 24、右下角24 * 24等四个区域，然后拉伸中间剩余的 2 * 2 的区域以适配指定大小
                Image("icons8-ios-application-placeholder-50")
                    .resizable(capInsets: EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24), resizingMode: .stretch)
                    .frame(width: 300, height: 300, alignment: .center)
                
                // 将 `resizingMode` 指定为 .tile，则会应用原图进行平铺给的的视图
                Image("icons8-ios-application-placeholder-50")
                    .resizable(resizingMode: .tile)
                    .frame(width: 300, height: 300, alignment: .center)
            }
        }
    }
}

struct SU_Resizable_Previews: PreviewProvider {
    static var previews: some View {
        SU_Resizable()
    }
}
