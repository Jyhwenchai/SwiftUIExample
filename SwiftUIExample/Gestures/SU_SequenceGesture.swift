//
//  SU_SequenceGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `SequenceGesture` 用与将两个手势组成一个手势的序列
struct SU_SequenceGesture: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        let minimumLongPressDuration = 0.5
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                // 长按手势开始
                case .first(true):
                    state = .pressing
                // 长按手势结束, 拖拽手势开始
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                default:
                    // 拖拽手势结束或长按手势取消
                    state = .inactive
                }
            }
            .onEnded { value in
                guard case .second(true, let drag?) = value else { return }
                self.viewState.width += drag.translation.width
                self.viewState.height += drag.translation.height
            }
        return Circle()
            .fill(Color.blue)
            .overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(
                x: viewState.width + dragState.translation.width,
                y: viewState.height + dragState.translation.height
            )
            .animation(nil)
            .shadow(radius: dragState.isActive ? 8 : 0)
            .animation(.linear(duration: minimumLongPressDuration))
            .gesture(longPressDrag)
    }
}

struct SU_SequenceGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_SequenceGesture()
    }
}
