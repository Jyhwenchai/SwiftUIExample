//
//  DateWidgetBundle.swift
//  DateWidget
//
//  Created by 蔡志文 on 6/21/24.
//

import WidgetKit
import SwiftUI

@main
struct DateWidgetBundle: WidgetBundle {
    var body: some Widget {
      StaticWidget()
//        DateWidget()
//        DateWidgetControl()
//        DateWidgetLiveActivity()
    }
}
//@main
//struct DateWidgetBundle {
//  // Combine widgets in this way to prevent crashes.
//  static func main() {
//    if #available(iOSApplicationExtension 18.0, *) {
//      WidgetsBundle18.main()
//    } else {
//      WidgetsBundle14.main()
//    }
//  }
//}


struct WidgetsBundle14: WidgetBundle {
  var body: some Widget {
    StaticWidget()
    //      DateWidget()
  }
}

@available(iOSApplicationExtension 18.0, *)
struct WidgetsBundle18: WidgetBundle {
    var body: some Widget {
      StaticWidget()
      DateWidgetControl()
      DateWidgetLiveActivity()
    }
}
