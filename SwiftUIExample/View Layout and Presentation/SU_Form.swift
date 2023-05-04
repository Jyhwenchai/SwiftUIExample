//
//  SU_Form.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

private enum NotifyMeAboutType {
  case directMessages
  case mentions
  case anything
}

private enum ProfileImageSize {
  case large
  case medium
  case small
}
/**
 ## 表单
 表单是一个静态滚动列表，用于放置一些基础的视图控件或者是其他容器类（如：Section、Group）

 SwiftUI 将以适合平台的方式呈现表单。例如，在iOS上，表单显示为分组列表。使用“部分”将表单内容的不同部分分组
 */
struct SU_Form: View {

  @State var notifyMeAbout: Int = 1
  @State var playNotificationSounds: Bool = false
  @State var sendReadReceipts: Bool = false
  @State var profileImageSize: Int = 1


  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Notifications")) {
          Picker("Notify Me About", selection: $notifyMeAbout) {
            Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
            Text("Mentions").tag(NotifyMeAboutType.mentions)
            Text("Anything").tag(NotifyMeAboutType.anything)
          }
          Toggle("Play notification sounds", isOn: $playNotificationSounds)
          Toggle("Send read receipts", isOn: $sendReadReceipts)
        }
        Section(header: Text("User Profiles")) {
          Picker("Profile Image Size", selection: $profileImageSize) {
            Text("Large").tag(ProfileImageSize.large)
            Text("Medium").tag(ProfileImageSize.medium)
            Text("Small").tag(ProfileImageSize.small)
          }
          Button("Clear Image Cache") {}
        }
      }
    }
  }
}

struct SU_Form_Previews: PreviewProvider {
  static var previews: some View {
    SU_Form()
  }
}
