//
//  US_AlignmentGuide.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/18.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/**
 顶部对齐
 super.top
 child.top
 child.top
 child.top
 
 居中对齐
 super.center
 child.top
 child.top
 child.top
 
 底部对齐
 super.bottom
 child.top
 child.top
 child.top
 */
struct US_AlignmentGuide: View {

  var body: some View {
    VStack {

      HStack(alignment: VerticalAlignment.top) {
        Rectangle().fill(Color.orange).frame(width: 100, height: 60)
          .alignmentGuide(VerticalAlignment.top) { d in d[VerticalAlignment.bottom]}
        Rectangle().fill(Color.orange).frame(width: 110, height: 100)
          .alignmentGuide(VerticalAlignment.top) { d in d[VerticalAlignment.center] }
        Rectangle().fill(Color.orange).frame(width: 80, height: 70)
          .alignmentGuide(VerticalAlignment.top) { d in d[VerticalAlignment.top] }
      }.background(Color.blue)

      HStack(alignment: .custom) {
        Rectangle().fill(Color.orange).frame(width: 100, height: 60).alignmentGuide(.custom) { d in d[VerticalAlignment.bottom] }
        Rectangle().fill(Color.orange).frame(width: 110, height: 100).alignmentGuide(.custom) { d in d[VerticalAlignment.center] }
        Rectangle().fill(Color.orange).frame(width: 80, height: 70).alignmentGuide(.custom) { d in d[VerticalAlignment.top] }
      }.background(Color.blue)

      ZStack(alignment: .anchor) {
        Rectangle().fill(Color.orange).frame(width: 100, height: 60)
//          .hidden()
          .alignmentGuide(HorizontalAlignment.anchor) { d in d[.trailing] }
          .alignmentGuide(VerticalAlignment.anchor) { d in d[.bottom] }
          .border(Color.orange)
        Rectangle().fill(Color.green).frame(width: 110, height: 130)
//          .hidden()
          .alignmentGuide(HorizontalAlignment.anchor) { d in d[HorizontalAlignment.center] }
          .alignmentGuide(VerticalAlignment.anchor) { d in d[VerticalAlignment.top] }
          .border(Color.green)
        Rectangle().fill(Color.red).frame(width: 80, height: 100)
//          .hidden()
          .alignmentGuide(HorizontalAlignment.anchor) { d in d[.leading] }
          .alignmentGuide(VerticalAlignment.anchor) { d in d[.bottom] }
          .border(Color.red)
      }
      .frame(width: 300, height: 200)
      .background(Color.blue)

      ZStack(alignment: .trailing) {
        Rectangle().fill(Color.red).frame(width: 80, height: 100)
          .alignmentGuide(HorizontalAlignment.trailing) { d in d[.leading] }
        Rectangle().fill(Color.purple).frame(width: 110, height: 150)
          .alignmentGuide(HorizontalAlignment.trailing) { d in d[.trailing] }
        //                    .alignmentGuide(VerticalAlignment.top) { d in d[.top] }
        Rectangle().fill(Color.green).frame(width: 100, height: 100)
          .alignmentGuide(HorizontalAlignment.trailing) { d in d[.trailing] }
        //                    .alignmentGuide(VerticalAlignment.top) { d in d[.bottom] }
        Rectangle().fill(Color.orange).frame(width: 40, height: 130)
          .alignmentGuide(HorizontalAlignment.trailing) { d in d[.leading] }
        //                    .alignmentGuide(VerticalAlignment.top) { d in d[.bottom] }
          .border(Color.red)
      }.background(Color.blue)
    }
  }
}

extension VerticalAlignment {
  enum Custom: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat { d[VerticalAlignment.bottom] }
  }
  static let custom = VerticalAlignment(Custom.self)
}

extension HorizontalAlignment {
  enum Anchor: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat { d[HorizontalAlignment.center] }
  }
  static let anchor = HorizontalAlignment(Anchor.self)
}

extension VerticalAlignment {
  enum Anchor: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat { d[VerticalAlignment.center] }
  }
  static let anchor = VerticalAlignment(Anchor.self)
}

extension Alignment {
  static let anchor = Alignment(horizontal: .anchor, vertical: .anchor)
}


struct US_AlignmentGuide_Previews: PreviewProvider {
  static var previews: some View {
    US_AlignmentGuide()
  }
}
