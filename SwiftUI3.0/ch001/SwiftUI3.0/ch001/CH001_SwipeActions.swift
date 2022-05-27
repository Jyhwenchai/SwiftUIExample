//
//  CH001_SwipeActions.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_SwipeActions: View {
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("User Task \(index)")
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "house.fill")
                        }
                        .tint(.red)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "photo")
                        }
                        .tint(.yellow)
                        
                    }
            }
        }
    }
}

struct CH001_SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        CH001_SwipeActions()
    }
}
