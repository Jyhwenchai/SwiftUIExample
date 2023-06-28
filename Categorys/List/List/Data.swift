//
//  Data.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

let data: [(String, [Feature])] = [
  ("List initialize", [
    .init("CreateList", CreateList()),
    .init("ListSection", ListSection())
  ]),
  ("ListStyle", [
    .init("ListStyle", ListStyle_())
  ]),
  ("ListGroup", [
    .init("ListOutlineGroup", ListOutlineGroup()),
    .init("ListDisclosureGroup", ListDisclosureGroup()),
  ]),
  ("Configuring rows", [
    .init("ListRowInsets", ListRowInsets()),
    .init("ListItemTint", ListItemTint_()),
  ]),
  ("Configuring separators", [
    .init("ListRowSeparator", ListRowSeparator()),
    .init("ListRowSeparatorTint", ListRowSeparatorTint()),
    .init("ListSectionSeparator", ListSectionSeparator()),
    .init("ListSectionSeparatorTint", ListSectionSeparatorTint()),
  ]),
  ("Configuring headers", [
    .init("HeaderProminence", ListHeaderProminence()),
  ]),
  ("Configuring Spacings", [
    .init("ListRowSpacing", ListRowSpacing()),
    .init("ListSectionSpacing", ListSectionSpacing_()),
  ]),
  ("Configuring backgrounds", [
    .init("ListRowBackground", ListRowBackground()),
  ]),
  ("Displaying a badge on a list item", [
    .init("ListBadge", ListBadge()),
    .init("ListBadgeProminence", ListBadgeProminence()),
  ]),
  ("Configuring interaction", [
    .init("ListSwipeActions", ListSwipeActions()),
    .init("ListSelectionDisabled", ListSelectionDisabled()),
  ]),
  ("Refreshing a list's content", [
    .init("ListRefreshable", ListRefreshable()),
  ]),
  ("Editing a list", [
    .init("ListEdit", ListEdit()),
  ]),
]

struct Feature: Identifiable {
  let title: String
  let view: AnyView
  var id: String { title }
  init(_ title: String, _ view: some View) {
    self.title = title
    self.view = AnyView(view)
  }
}

extension Color {
  static var random: Color { Color(
    red: Double.random(in: 0..<1),
    green: Double.random(in: 0..<1),
    blue: Double.random(in: 0..<1))
  }
}
