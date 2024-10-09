//
//  DateWidgetLiveActivity.swift
//  DateWidget
//
//  Created by 蔡志文 on 6/21/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DateWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

@available(iOSApplicationExtension 18.0, *)
struct DateWidgetLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: DateWidgetAttributes.self) { context in
      // Lock screen/banner UI goes here
      VStack {
        Text("Hello \(context.state.emoji)")
      }
      .activityBackgroundTint(Color.cyan)
      .activitySystemActionForegroundColor(Color.black)

    } dynamicIsland: { context in
      DynamicIsland {
        // Expanded UI goes here.  Compose the expanded UI through
        // various regions, like leading/trailing/center/bottom
        DynamicIslandExpandedRegion(.leading) {
          Text("Leading")
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text("Trailing")
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text("Bottom \(context.state.emoji)")
          // more content
        }
      } compactLeading: {
        Text("L")
      } compactTrailing: {
        Text("T \(context.state.emoji)")
      } minimal: {
        Text(context.state.emoji)
      }
      .widgetURL(URL(string: "http://www.apple.com"))
      .keylineTint(Color.red)
    }
  }
}

extension DateWidgetAttributes {
  fileprivate static var preview: DateWidgetAttributes {
    DateWidgetAttributes(name: "World")
  }
}

extension DateWidgetAttributes.ContentState {
  fileprivate static var smiley: DateWidgetAttributes.ContentState {
    DateWidgetAttributes.ContentState(emoji: "😀")
  }

  fileprivate static var starEyes: DateWidgetAttributes.ContentState {
    DateWidgetAttributes.ContentState(emoji: "🤩")
  }
}


@available(iOSApplicationExtension 18.0, *)
#Preview("Notification", as: .content, using: DateWidgetAttributes.preview) {
  DateWidgetLiveActivity()
} contentStates: {
  DateWidgetAttributes.ContentState.smiley
  DateWidgetAttributes.ContentState.starEyes
}
