//
//  SU_MorePreviewLayout.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 更多预览大小的设置可以看这篇文章
 
 https://nshipster.com/swiftui-previews/
 */
struct SU_MorePreviewLayout: View {
    var body: some View {
        BorderedButton()
    }
}

struct BorderedButton: View {
    
    var body: some View {
        Button(action: {}) {
            Text("Button")
        }
    }
}

class UIBorderedButton: UIButton {
    
}

struct SU_MorePreviewLayout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BorderedButton()
                .previewLayout(.sizeThatFits)
                .padding()

            UIViewPreview {
                let borderButton = UIBorderedButton()
                borderButton.setTitle("UIButton", for: .normal)
                borderButton.setTitleColor(UIColor.blue, for: .normal)
                return borderButton
            }
            .previewLayout(.sizeThatFits)
            .padding()
            
        }
    }
}


