//
//  ChatData.swift
//  ITime
//
//  Created by 蔡志文 on 5/26/23.
//

import Foundation

enum ChartData: Identifiable {
  case bar
  var id: Self { self }
}


struct Pancakes: Identifiable {
  let name: String
  let sales: Int

  var id: String { name }
}


struct SalesSummary: Identifiable {
  var id: UUID = UUID()
  let weekday: Date
  let sales: Int
  init(weekday: Date, sales: Int) {
    self.weekday = weekday
    self.sales = sales
  }
}

func date(_ year: Int, _ month: Int, _ day: Int) -> Date {
  let calendar = Calendar.current
  var dateComponents = DateComponents()
  dateComponents.year = year
  dateComponents.month = month
  dateComponents.day = day
  return calendar.date(from: dateComponents) ?? Date()
}

//func date(_ year: Int, _ month: Int, _ day: Int) -> String {
//  let calendar = Calendar.current
//  var dateComponents = DateComponents()
//  dateComponents.year = year
//  dateComponents.month = month
//  dateComponents.day = day
//
//  if let date = calendar.date(from: dateComponents) {
//    let weekday = calendar.component(.weekday, from: date)
//    let dateFormatter = DateFormatter()
//    return String(dateFormatter.weekdaySymbols[weekday - 1].prefix(3))
//  }
//
//  return ""
//}

struct SalesSeries: Identifiable {
  let city: String
  let salesSummaries: [SalesSummary]
  var id: String { city }
}

let sales: [Pancakes] = [
  .init(name: "Cachapa", sales: 900),
  .init(name: "Injera", sales: 382),
  .init(name: "Crepe", sales: 666),
  .init(name: "Dosa", sales: 575),
  .init(name: "American", sales: 866),
  .init(name: "China", sales: 466),
]

let sfData: [SalesSummary] = [
  .init(weekday: date(2022, 5, 2), sales: 81),
  .init(weekday: date(2022, 5, 3), sales: 88),
  .init(weekday: date(2022, 5, 4), sales: 61),
  .init(weekday: date(2022, 5, 5), sales: 73),
  .init(weekday: date(2022, 5, 6), sales: 31),
  .init(weekday: date(2022, 5, 7), sales: 41),
  .init(weekday: date(2022, 5, 8), sales: 89),
]

let cupertinoData: [SalesSummary] = [
  .init(weekday: date(2022, 5, 2), sales: 31),
  .init(weekday: date(2022, 5, 3), sales: 68),
  .init(weekday: date(2022, 5, 4), sales: 41),
  .init(weekday: date(2022, 5, 5), sales: 73),
  .init(weekday: date(2022, 5, 6), sales: 11),
  .init(weekday: date(2022, 5, 7), sales: 61),
  .init(weekday: date(2022, 5, 8), sales: 59),
]

let salesSeries: [SalesSeries] = [
  SalesSeries(city: "China", salesSummaries: sfData),
  SalesSeries(city: "American", salesSummaries: cupertinoData),
]
