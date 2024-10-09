//
//  StaticWidget.swift
//  WedgitSample
//
//  Created by 蔡志文 on 6/25/24.
//

import SwiftUI
import WidgetKit

struct StaticTimelineEntry: TimelineEntry {
  var date: Date
  var desc: String
}

struct StaticTimelineProvider: TimelineProvider {

  typealias Entry = StaticTimelineEntry

  func placeholder(in context: Context) -> Entry {
    StaticTimelineEntry(date: Date(), desc: "Placeholder")
  }

  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    let entry = StaticTimelineEntry(date: Date(), desc: "Snapshot")
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    var entries: [StaticTimelineEntry] = []
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
        let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = StaticTimelineEntry(date: entryDate, desc: "hello \(hourOffset)")
        entries.append(entry)
    }

    let timeLine = Timeline(entries: entries, policy: .atEnd)
    completion(timeLine)
  }
}

struct StaticWidget: Widget {
  let kind: String = "staticWidget"
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: StaticTimelineProvider()) { entry in
      StaticWidgetView(entry: entry)
    }
  }
}

struct StaticWidgetView: View {
  let entry: StaticTimelineEntry
  @Environment(\.widgetFamily) var family

  @ViewBuilder
  var body: some View {
    switch family {
    case .systemSmall:
      VStack {
        Text(entry.date, style: .time)
        Text("\(entry.desc), time: \(entry.date.timeIntervalSince1970)")
      }
    case .systemMedium:
      VStack {
        Text(entry.date, style: .time)
        Text("medium: \(entry.desc), time: \(entry.date.timeIntervalSince1970)")
      }
    case .systemLarge:
      VStack {
        Text(entry.date, style: .time)
        Text("large: \(entry.desc), time: \(entry.date.timeIntervalSince1970)")
      }
    case .systemExtraLarge:
      VStack {
        Text(entry.date, style: .time)
        Text("Extra large: \(entry.desc), time: \(entry.date.timeIntervalSince1970)")
      }
    default:
      VStack {
        Text(entry.date, style: .time)
        Text("\(entry.desc), time: \(entry.date.timeIntervalSince1970)")
      }
    }
  }
}

@available(iOS 18.0, *)
#Preview(as: .systemMedium) {
  StaticWidget()
} timeline: {
  StaticTimelineEntry(date: Date(), desc: "Static Widget")
}
