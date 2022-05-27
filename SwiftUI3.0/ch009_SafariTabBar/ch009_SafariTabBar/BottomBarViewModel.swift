//
//  BottomBarViewModel.swift
//  ch009_SafariTabBar
//
//  Created by 蔡志文 on 2022/5/19.
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
    @Published var searchText = "iJustine"
    
    // Offset
    @Published var offset: CGFloat = 0
    @Published var lastStoredOffset: CGFloat = 0
    @Published var tabState: BottomState = .floating
}

// Enum For State
enum BottomState {
    case floating
    case expanded
}
