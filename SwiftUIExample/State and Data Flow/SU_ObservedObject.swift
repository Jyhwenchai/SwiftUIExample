//
//  SU_ObservedObject.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `@ObservedObject`
///
/// 属性包装器类型，它订阅可观察对象并在可观察对象发生更改时使视图无效。
///
/// 在传统方式的使用中我们无法直接将一个 Modal 中的属性值的变化直接映射到视图当中，在 SwiftUI 中提供了很好的方式来使 Modal 中的数据立即与视图的状态保持同步。
///
/// 在下面创建的模型中我们需要将 Book 遵循 `ObservableObject` 协议，同时将我们需要监听的属性使用 `@Published` 属性包裹器进行修饰。然后在使用 `Book` 时使用 `@ObservedObject` 属性包裹器修饰以便系统自动跟踪其值的变化。这样当我们修改了 `Book` 中使用 `@Published` 修饰的属性后，系统会自动推断该类的 `ObjectWillChangePublisher` 关联类型，并合成所需的 `objectWillChange` 方法，该方法发出使用 `@Published` 修饰的属性的更改值，以同步相应的属性。

class Book: ObservableObject {
    @Published var name: String = ""
    @Published var describe: String = "default describe"
}

struct SU_ObservedObject: View {
    
    @ObservedObject var book: Book = Book()
    
    var body: some View {
        VStack {
            Text("\(book.name)")
            Text("\(book.describe)")
            TextField("edit book name", text: $book.name)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 44, alignment: .center)
                .border(Color.orange, width: 2)
            TextEditor(text: $book.describe)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 144, alignment: .center)
                .border(Color.orange, width: 2)
        }
    }
}

struct SU_ObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        SU_ObservedObject()
    }
}
