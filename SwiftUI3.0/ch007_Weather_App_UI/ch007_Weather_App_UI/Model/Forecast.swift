//
//  Forecast.swift
//  ch007_Weather_App_UI
//
//  Created by 蔡志文 on 2022/5/7.
//

import SwiftUI


struct DayForecast: Identifiable {
    var id = UUID().uuidString
    var day: String
    var farenheit: CGFloat
    var image: String
}

var forecast = [
    DayForecast(day: "Today", farenheit: 95, image: "sun.min"),
    DayForecast(day: "Wed", farenheit: 90, image: "cloud.sun"),
    DayForecast(day: "Tue", farenheit: 98, image: "cloud.sun.bolt"),
    DayForecast(day: "Thu", farenheit: 91, image: "sun.max"),
    DayForecast(day: "Fri", farenheit: 93, image: "cloud.sun"),
    DayForecast(day: "Sat", farenheit: 95, image: "cloud.sun"),
    DayForecast(day: "Sun", farenheit: 93, image: "sun.max"),
    DayForecast(day: "Mon", farenheit: 97, image: "sun.max"),
    DayForecast(day: "Tue", farenheit: 92, image: "cloud.sun.bolt"),
    DayForecast(day: "Wed", farenheit: 91, image: "sun.min"),
]
