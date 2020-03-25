#  View and Controls

SwiftUI 中一些控件的专有方法或修改器

## Text

### Initialize

* ```swift
  init<S>(_ content: S) where S : StringProtocol
  ```

* ```swift
  init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil)
  ```

* ```swift
  init(verbatim content: String)
  ```

### 选择字体

* ```swift
  func font(_ font: Font?) -> Text
  ```
* ```swift
  static func + (lhs: Text, rhs: Text) -> Text
  ```
* ```swift
	func fontWeight(_ weight: Font.Weight?) -> Text
	```

### 样式

* ```swift
	func foregroundColor(_ color: Color?) -> Text
	```
* ```swift
	func bold() -> Text
	```
* ```swift
	func italic() -> Text```
	```
* ```swift
	func baselineOffset(_ baselineOffset: CGFloat) -> Text
	```
* ```swift
	func tracking(_ tracking: CGFloat) -> Text
	```
* ```swift
	func kerning(_ kerning: CGFloat) -> Text
	```
* ```swift
	func underline(_ active: Bool = true, color: Color? = nil) -> Text
	```
* ```swift
	func strikethrough(_ active: Bool = true, color: Color? = nil) -> Text
	```

### 使文本适配可用的空间

* ```swift
	func allowsTightening(_ flag: Bool) -> some View
	```
* ```swift
	func minimumScaleFactor(_ factor: CGFloat) -> some View
	```
* ```swift
	func truncationMode(_ mode: Text.TruncationMode) -> some View
	```

### 操作多行文本

* ```swift
	func lineLimit(_ number: Int?) -> some View
	```
* ```swift
	func lineSpacing(_ lineSpacing: CGFloat) -> some View
	```
* ```swift
	func multilineTextAlignment(_ alignment: TextAlignment) -> some View
	```



## TextField

### Initialize

* ```swift
	init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})
	```
* ```swift
	init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol
	```
* ```swift
	init<T>(_ titleKey: LocalizedStringKey, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})
	```
* ```swift
	init<S, T>(_ title: S, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol
	```



## SecureField

### Initialize

* ```swift
	init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void = {})
	```
* ```swift
	init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S : StringProtocol
	```



## Image

### Initialize

* ```swift
	init(_ name: String, bundle: Bundle? = nil)
	```
* ```swift
	init(_ name: String, bundle: Bundle? = nil, label: Text)
	```
* ```swift
	init(decorative name: String, bundle: Bundle? = nil)
	```
* ```swift
	init(nsImage: NSImage)
	```
* ```swift
	init(systemName: String)
	```
* ```swift
	init(uiImage: UIImage)
	```
* ```swift
	init(_ cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up, label: Text)
	```
* ```swift
	init(decorative cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up)
	```

### 样式

* ```swift
	func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image
	```
* ```swift
	func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image
	```
* ```swift
	func interpolation(_ interpolation: Image.Interpolation) -> Image
	```
* ```swift
	func antialiased(_ isAntialiased: Bool) -> Image
	```



## Button

```swift
struct Button<Label> where Label : View
```

### Initialize

* ```swift
	init(_ configuration: PrimitiveButtonStyleConfiguration)
	```
* ```swift
	init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void)
	```
* ```swift
	init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol
	```
* ```swift
	init(action: @escaping () -> Void, label: () -> Label)
	```



## Toggle

### Initialize

* ```swift
  init(_ configuration: ToggleStyleConfiguration)
  ```

* ```swift
  init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>)
  ```

* ```swift
  init<S>(_ title: S, isOn: Binding<Bool>) where S : StringProtocol
  ```

* ```swift
  init(isOn: Binding<Bool>, label: () -> Label)
  ```



## Picker

### Initialize

* ```swift
  init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>, content: () -> Content)
  ```

* ```swift
  init<S>(_ title: S, selection: Binding<SelectionValue>, content: () -> Content) where S : StringProtocol
  ```

* ```swift
  init(selection: Binding<SelectionValue>, label: Label, content: () -> Content)
  ```



## DatePicker

### Initialize

* ```swift
  init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])
  ```

* ```swift
  init<S>(_ title: S, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
  ```

* ```swift
  init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])
  ```

* ```swift
  init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])
  ```

* ```swift
  init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])
  ```

* ```swift
  init<S>(_ title: S, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
  ```

* ```swift
  init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
  ```

* ```swift
  init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
  ```

* ```swift
  init(selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], label: () -> Label)
  ```

* ```swift
  init(selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], label: () -> Label)
  ```

* ```swift
  init(selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], label: () -> Label)
  ```

* ```swift
  init(selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], label: () -> Label)
  ```



## Slider

### Initialize

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
  ```



## Stepper

### Initialize

* ```swift
  init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in })
  ```

* ```swift
  init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol
  ```

* ```swift
  init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable
  ```

* ```swift
  init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable
  ```

* ```swift
  init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable
  ```

* ```swift
  init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable≈
  ```

* ```swift
  init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, label: () -> Label)
  ```

* ```swift
  init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, label: () -> Label) where V : Strideable
  ```

* ```swift
  init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, label: () -> Label) where V : Strideable
  ```

  

## NavigationLink

```swift
struct NavigationLink<Label, Destination> where Label : View, Destination : View
```

### Initialize

* ```swift
  init(_ titleKey: LocalizedStringKey, destination: Destination)
  ```

* ```swift
  init<S>(_ title: S, destination: Destination) where S : StringProtocol
  ```

* ```swift
  init(_ titleKey: LocalizedStringKey, destination: Destination, isActive: Binding<Bool>)
  ```

* ```swift
  init<S>(_ title: S, destination: Destination, isActive: Binding<Bool>) where S : StringProtocol
  ```

* ```swift
  init<V>(_ titleKey: LocalizedStringKey, destination: Destination, tag: V, selection: Binding<V?>) where V : Hashable
  ```

* ```swift
  init<S, V>(_ title: S, destination: Destination, tag: V, selection: Binding<V?>) where S : StringProtocol, V : Hashable
  ```

* ```swift
  init(destination: Destination, isActive: Binding<Bool>, label: () -> Label)
  ```

* ```swift
  init(destination: Destination, label: () -> Label)
  ```

* ```swift
  init<V>(destination: Destination, tag: V, selection: Binding<V?>, label: () -> Label) where V : Hashable
  ```

* ```swift
  init(destinationName: String, isActive: Binding<Bool>, label: () -> Label)
  ```

* ```swift
  init(destinationName: String, label: () -> Label)
  ```

* ```swift
  init<V>(destinationName: String, tag: V, selection: Binding<V?>, label: () -> Label) where V : Hashable
  ```

### Configuring the Link

* ```swift
  func isDetailLink(_ isDetailLink: Bool) -> some View
  ```

  

## MenuButton

```swift
struct MenuButton<Label, Content> where Label : View, Content : View
```

### Initialize

* ```swift
  init(_ titleKey: LocalizedStringKey, content: () -> Content)
  ```

* ```swift
  init<S>(_ title: S, content: () -> Content) where S : StringProtocol
  ```

* ```swift
  init(label: Label, content: () -> Content)
  ```



## EditButton

### 实例方法

* ```swift
  func onDrag(_ data: @escaping () -> NSItemProvider) -> some View
  ```

* ```swift
  func onDrop(of supportedTypes: [String], delegate: DropDelegate) -> some View
  ```

* ```swift
  func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View
  ```

* ```swift
  func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View
  ```

  
