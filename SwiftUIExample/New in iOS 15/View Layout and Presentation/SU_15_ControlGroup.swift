//
//  SU_15_ControlGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/12/6.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SU_15_ControlGroup: View {
    var body: some View {
        VStack {
            ControlGroup {
                Button(action: {}) {
                    Label("Decrease", systemImage: "minus")
                }
                
                Button(action: {}) {
                    Label("Increase", systemImage: "plus")
                }
            }
            
            Divider()
            ControlGroup {
                Button("Action 1") {}
                Button("Action 2") {}
            }
            .controlGroupStyle(VerticalControlGroupStyle())

//            Divider()
//            ControlGroup {
//                Button("Action 1") {}
//                Button("Action 2") {}
//            }.controlGroupStyle(.with(title: "Actions"))
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_ControlGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_ControlGroup()
    }
}

struct VerticalControlGroupStyle: ControlGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.content
        }
    }
}

struct ControlGroupTitleStyle: ControlGroupStyle {
    
    let title: LocalizedStringKey
    func makeBody(configuration: Configuration) -> some View {
        Text(title)
        VStack {
            configuration.content
        }
    }
}

@available(iOS 15.0.0, *)
extension ControlGroupStyle where Self == ControlGroupTitleStyle {
    static func with(title: LocalizedStringKey) -> ControlGroupTitleStyle {
        return ControlGroupTitleStyle(title: title)
    }
}
