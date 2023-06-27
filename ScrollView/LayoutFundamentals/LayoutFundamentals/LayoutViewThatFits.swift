//
//  LayoutViewThatFits.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// `ViewThatFits` 会评估内部的子视图，从而显示子视图中尺寸最接近设置的一个
struct LayoutViewThatFits: View {
  var body: some View {
    VStack {
      /** 尺寸大于100，显示
      HStack {
        Text("\(uploadProgress.formatted(.percent))")
        ProgressView(value: uploadProgress)
          .frame(width: 100)
      }
      */
      UploadProgressView(uploadProgress: 0.75)
        .frame(maxWidth: 200)
      /** 尺寸等于100，显示
       ProgressView(value: uploadProgress)
       .frame(width: 100)
      */
      UploadProgressView(uploadProgress: 0.75)
        .frame(maxWidth: 100)
      /** 尺寸小于50，显示
       Text("\(uploadProgress.formatted(.percent))")
      */
      UploadProgressView(uploadProgress: 0.75)
        .frame(maxWidth: 50)
    }
  }
}

struct UploadProgressView: View {
  var uploadProgress: Double

  var body: some View {
    ViewThatFits(in: .horizontal) {
      HStack {
        Text("\(uploadProgress.formatted(.percent))")
        ProgressView(value: uploadProgress)
          .frame(width: 100)
      }
      ProgressView(value: uploadProgress)
        .frame(width: 100)
      Text("\(uploadProgress.formatted(.percent))")
    }
  }
}

#Preview {
  LayoutViewThatFits()
}
