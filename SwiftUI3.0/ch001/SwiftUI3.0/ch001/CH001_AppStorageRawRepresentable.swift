//
//  CH001_AppStorageRawRepresentable.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_AppStorageRawRepresentable: View {
    @AppStorage("deviceType") var device: Device?
    var body: some View {
        VStack {
            if let deviceType = device {
                Text(deviceType.rawValue)
            }
            Button {
                device = .iPhone12
            } label: {
                Text("Select iPhone 12")
            }
        }
    }
}

enum Device: String {
    case iPhone8 = "8"
    case iPhone11 = "11"
    case iPhone12 = "12"
}

struct CH001_AppStorageRawRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        CH001_AppStorageRawRepresentable()
    }
}
