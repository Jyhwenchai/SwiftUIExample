//
//  ContentView.swift
//  TextSample
//
//  Created by 蔡志文 on 1/7/25.
//

import SwiftUI

struct ContentView: View {
  var attributedString: AttributedString {
    var attributedString = AttributedString("This is a string with empty attributes.")
    var container = AttributeContainer()
    container[AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute.self] = .red
    attributedString.mergeAttributes(container, mergePolicy: .keepNew)
    return attributedString
  }

  let string: String = "Hello, World"
  var subString: Substring { string[string.startIndex ..< string.index(string.startIndex, offsetBy: 5)] }
  var body: some View {
    Form {
      Section("普通使用") {
        /// 内容是 String
        Text(string)
        /// 内容是 Image
        Text(Image(systemName: "globe")) + Text("Globe")
        /// 内容是 AttributedString
        Text(attributedString)
        Text(LocalizedStringResource(stringLiteral: "Localized String"))
        /// 内容是 符合 StringProtocol 协议的类型（String, SubString）
        Text(subString)
        Text("Sets to a closed range the number of lines that text can occupy in this view.")
        // 行数限制
          .lineLimit(2)
        // 行间距
          .lineSpacing(10)
        // 多行对齐
          .multilineTextAlignment(.center)

        // Text拼接
        let subText = Text("，")
        Text("Hello\(subText) World")
      }

      Section("处理时间") {
        /// 内容是 DateInterval
        Text(DateInterval(start: Date(), duration: 1000))
        /// 内容是 ClosedRange<Date>
        Text(Date()...Date().addingTimeInterval(1000))
        /// 内容是 Date
        Text(Date(), style: .date)

        /// TimeDataSource
        Text(.currentDate, format: .dateTime)
        Text(.now, format: .dateTime)
        Text(.distantPast, format: .dateTime)

        // 使用 DateFormatter
        let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateStyle = .long
          formatter.timeStyle = .short
          return formatter
        }()

        Text(Date(), formatter: dateFormatter) // 输出如：2025年1月7日 下午3:30

        // 使用 DateComponentsFormatter
//        let componentsFormatter: DateComponentsFormatter = {
//          let formatter = DateComponentsFormatter()
//          formatter.allowedUnits = [.hour, .minute]
//          formatter.unitsStyle = .full
//          return formatter
//        }()

//        Text(NSNumber(3600), formatter: componentsFormatter)  // 输出：1小时
        Text(timerInterval: Date()...Date().addingTimeInterval(60), pauseTime: Date().addingTimeInterval(-1), countsDown: true)
      }

      Section("数字格式化") {
        // 使用 NumberFormatter
        let numberFormatter: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .decimal
          formatter.maximumFractionDigits = 2
          return formatter
        }()

        Text(NSNumber(value: 1234.5678), formatter: numberFormatter) // 输出：1,234.57

        // 货币格式化
        let currencyFormatter: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .currency
          formatter.locale = Locale(identifier: "zh_CN")
          return formatter
        }()

        Text(NSNumber(value: 1234.56), formatter: currencyFormatter) // 输出：¥1,234.56

        // 使用 NumberFormatter 的百分比样式
        let percentFormatter: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .percent
          formatter.maximumFractionDigits = 1
          return formatter
        }()

        Text(NSNumber(value: 0.8523), formatter: percentFormatter) // 输出：85.2%

        // 测量单位格式化使用 MeasurementFormatter
        let measurementFormatter: MeasurementFormatter = {
          let formatter = MeasurementFormatter()
          formatter.unitOptions = .providedUnit
          formatter.unitStyle = .medium
          return formatter
        }()

        let distance = Measurement(value: 42.195, unit: UnitLength.kilometers)
        Text(distance, formatter: measurementFormatter) // 输出：42.195 km
      }

      Section("列表格式化") {
        // 使用 ListFormatter
        let listFormatter = ListFormatter()
        let items: NSArray = ["苹果", "香蕉", "橙子"]

        Text(items, formatter: listFormatter) // 输出：苹果、香蕉和橙子
        let formattedString = ListFormatter.localizedString(byJoining: items as! [String])
        Text(formattedString) // 推荐
      }

      Section("富文本处理") {}
    }
  }
}

#Preview {
  ContentView()
}
