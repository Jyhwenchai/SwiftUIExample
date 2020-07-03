//
//  SU_DragGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_DragGesture: View {
    @State var isDragging = false
    @State var offset = CGSize.zero
    @State var newPosition = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ value in
                isDragging = true
                offset = value.translation
            }
            .onEnded { value in
                isDragging = false
                newPosition.width += offset.width
                newPosition.height += offset.height
                offset = .zero
            }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: offset.width + newPosition.width, y: offset.height + newPosition.height)
            .gesture(drag)
    }
}

struct SU_DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_DragGesture()
    }
}
