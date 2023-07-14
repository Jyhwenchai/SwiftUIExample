//
//  tetst.swift
//  InteractiveWidgets
//
//  Created by 蔡志文 on 7/6/23.
//

import SwiftUI

struct TaskModel: Identifiable {
  var id: String = UUID().uuidString
  var taskTitle: String
  var isCompleted: Bool = false
}

class TaskDataModel {
  static let shared = TaskDataModel()
  var tasks: [TaskModel] = [
    .init(taskTitle: "Record Video!"),
    .init(taskTitle: "Edit Video!"),
    .init(taskTitle: "Publish Video!")
  ]
}
