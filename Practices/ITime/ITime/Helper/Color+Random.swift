//
//  Color+Random.swift
//  ITime
//
//  Created by 蔡志文 on 5/25/23.
//

import SwiftUI

extension Color {
  static var random: Color {
    Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
  }
}
