//
//  ToggleStateIntent.swift
//  InteractiveWidgets
//
//  Created by 蔡志文 on 7/6/23.
//

import SwiftUI
import AppIntents

struct ToggleStateIntent: AppIntent {
  static var title: LocalizedStringResource = "Toggle Task State"

  @Parameter(title: "Task ID")
  var id: String

  init() { }

  init(id: String) {
    self.id = id
  }

  func perform() async throws -> some IntentResult {
    if let index = TaskDataModel.shared.tasks.firstIndex(where: { task in
      task.id == id
    }) {
      TaskDataModel.shared.tasks[index].isCompleted.toggle()
    }
    return .result()
  }
}

