//
//  SU_ContextMenu.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func contextMenu<MenuItems>(_ contextMenu: ContextMenu<MenuItems>?) -> some View where MenuItems : View`
 
 `func contextMenu<MenuItems>(menuItems: () -> MenuItems) -> some View where MenuItems : View`
 
 将上下文菜单附加到视图, 可以长按查看效果。
 
 */
struct SU_ContextMenu: View {
    var body: some View {
        VStack(spacing: 100) {
            Text("Long Press Me")
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {}) {
                    Text("copy")
                }
            }))
            
            Text("Long Press Me")
                .contextMenu {
                    Button(action: { print("added") } ) { Text("Add") }
                    Button(action: { print("removed") } ) { Text("Remove") }
                }
        }
    }
}

struct SU_ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        SU_ContextMenu()
    }
}
