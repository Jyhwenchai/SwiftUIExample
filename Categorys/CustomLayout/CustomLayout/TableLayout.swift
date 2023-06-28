//
//  TableLayout.swift
//  CustomLayout
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct TableLayout: View {
    var body: some View {
      TabView {
        PeopleTable()
          .tabItem { Text("Basic") }
        SelectableTable()
          .tabItem { Text("Selectable") }
      }
    }
}

struct Person: Identifiable {
  let givenName: String
  let familyName: String
  let emailAddress: String
  let id = UUID()


  var fullName: String { givenName + " " + familyName }
}

struct PeopleTable: View {
  @State private var people = [
    Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
    Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
    Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
    Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
  ]

  var body: some View {
    Table(people) {
      TableColumn("Given Name", value: \.givenName)
      TableColumn("Family Name", value: \.familyName)
      TableColumn("E-Mail Address", value: \.emailAddress)
    }
  }
}

struct SelectableTable: View {
  @State private var selectedPeople = Set<Person.ID>()
  @State private var people = [
    Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
    Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
    Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
    Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com")
  ]

  var body: some View {
    Table(people, selection: $selectedPeople) {
      TableColumn("Given Name", value: \.givenName)
      TableColumn("Family Name", value: \.familyName)
      TableColumn("E-Mail Address", value: \.emailAddress)
    }
    Text("\(selectedPeople.count) people selected")
  }
}

#Preview {
    TableLayout()
}
