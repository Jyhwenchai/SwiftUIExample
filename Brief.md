# 重要的协议或类

## View 协议

表示SwiftUI视图的类型

### 实现 View 协议的类

* Text

* TextField

* SecureField

* Image

* Button

* NavigationLink

* EditButton

* MenuButton

* PasteButton

* Toggle

* Picker

* DatePicker

* Slider

* Stepper

* HStack

* VStack

* ZStack

* List

* ForEach

* ScrollView

* Form

* Group

* GroupBox

* Section

* Spacer

* Divider

* NavigationView

* TabView

* HSplitView

* VSplitView

* EmptyView

* EquatableView

* AnyView

* TupleView

* Color

* GeometryReader

* ModifiedContent

  当 `Content` 遵循于 `View` 协议 同时 `Modifier` 遵循 `ViewModifier` 协议时。
  
  

### 继承 View 协议的协议

* DynamicViewContent
* Shape

## Shape 协议

### 实现 Shape 协议的类

* Rectangle
* RoundedRectangle
* Circle
* Elipse
* Capsule
* Path
* ScaledShape
* RotatedShape
* OffsetShape
* TransformedShape

### 继承 Shape 的协议

* InsettableShape

## ShapeStyle 协议

### 实现 ShapeStyle 协议的类

* Color
* ImagePaint
* LinearGradient
* AngularGradient
* RadialGrandient
* ForegroundStyle
* FillStyle
* SelectinShapeStyle
* SeparatorShapeStyle

