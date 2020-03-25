# Drawing and Animation



## Shape

`Shape` 协议定义了绘制视图时可以使用的2D形状。

### Inherites From 

Animatable、View

### Methods

* ```swift
  func fill<S>(_ content: S, style: FillStyle = FillStyle()) -> some View where S : ShapeStyle
  ```

* ```swift
  func fill(style: FillStyle = FillStyle()) -> some View
  ```

* ```swift
  func offset(_ offset: CGSize) -> OffsetShape<Self>
  ```

* ```swift
  func offset(_ offset: CGPoint) -> OffsetShape<Self>
  ```

* ```swift
  func offset(x: CGFloat = 0, y: CGFloat = 0) -> OffsetShape<Self>
  ```

* ```swift
  func path(in rect: CGRect) -> Path
  ```

* ```swift
  func rotation(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self>
  ```

* ```swift
  func scale(_ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self>
  ```

* ```swift
  func scale(x: CGFloat = 1, y: CGFloat = 1, anchor: UnitPoint = .center) -> ScaledShape<Self>
  ```

* ```swift
  func size(_ size: CGSize) -> some Shape
  ```

* ```swift
  func size(width: CGFloat, height: CGFloat) -> some Shape
  ```

* ```swift
  func stroke<S>(_ content: S, lineWidth: CGFloat = 1) -> some View where S : ShapeStyle
  ```

* ```swift
  func stroke<S>(_ content: S, style: StrokeStyle) -> some View where S : ShapeStyle
  ```

* ```swift
  func stroke(lineWidth: CGFloat = 1) -> some Shape
  ```

* ```swift
  func stroke(style: StrokeStyle) -> some Shape
  ```

* ```swift
  func transform(_ transform: CGAffineTransform) -> TransformedShape<Self>
  ```

* ```swift
  func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape
  ```



## Shapes

### Rectangle

在包含矩形的视图框架内对齐的矩形

#### Initialize

```swift
@frozen struct Rectangle
```



### RoundedRectangle

具有圆角的矩形，在包含该矩形的视图框架内对齐。

#### Initialize

```swift
@frozen struct RoundedRectangle
```

#### Instance Properties

```swift
var animatableData: CGSize.AnimatableData { get set }

var body: _ShapeView<RoundedRectangle, ForegroundStyle> { get }

var cornerSize: CGSize

var style: RoundedCornerStyle
```



### Circle

以包含它的视图框架为中心的圆。

```swift
@frozen struct Circle
```



### Ellipse

在包含椭圆的视图框架内对齐的椭圆。

```swift
@frozen struct Ellipse
```



### Capsule

胶囊形状在包含它的视图框架内对齐。胶囊形状等效于圆角矩形，其中角半径选择为矩形最小边缘长度的一半。

```swift
@frozen struct Capsule
```

#### Initializers

```swift
init(style: RoundedCornerStyle = .circular)
```

#### Instance Properties

```swift
var animatableData: EmptyAnimatableData { get set }

var body: _ShapeView<Capsule, ForegroundStyle> { get }

var style: RoundedCornerStyle
```



### Path

绘制2D形状的轮廓。

```swift
@frozen struct Path
```

#### Initializers

```swift
init()

init(_ path: CGMutablePath)

init(_ path: CGPath)

init(_ callback: (inout Path) -> ())

init(_ rect: CGRect)

init?(_ string: String)

init(ellipseIn rect: CGRect)

init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .circular)

init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular)
```

#### Instance Properties

```swift
var animatableData: EmptyAnimatableData { get set }

var boundingRect: CGRect { get }

var cgPath: CGPath { get }

var currentPoint: CGPoint? { get }

var description: String { get }

var isEmpty: Bool { get }
```

#### Instance Methods

* ```swift
  // 向路径添加圆弧，并指定半径和角度
  mutating func addArc(center: CGPoint, 
                       radius: CGFloat, 
                       startAngle: Angle, 
                       endAngle: Angle, 
                       clockwise: Bool, 
                       transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 向路径添加圆弧，并指定半径和两条切线
  mutating func addArc(tangent1End p1: CGPoint, 
                       tangent2End p2: CGPoint, 
                       radius: CGFloat, 
                       transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 向路径添加三次Bézier曲线，并带有指定的终点和控制点。
  mutating func addCurve(to p: CGPoint, control1 cp1: CGPoint, control2 cp2: CGPoint)
  ```

* ```swift
  // 向路径添加一个椭圆
  mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 从当前点到指定点附加一条直线段。
  mutating func addLine(to p: CGPoint)
  ```

* ```swift
  // 将一系列连接的直线段添加到路径。
  mutating func addLines(_ lines: [CGPoint])
  ```

* ```swift
  // 将路径副本追加到路径。
  mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 将具有指定终点和控制点的二次贝塞尔曲线添加到路径。
  mutating func addQuadCurve(to p: CGPoint, control cp: CGPoint)
  ```

* ```swift
  // 在路径中添加一个矩形子路径
  mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 将一系列矩形子路径添加到路径
  mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 向路径添加圆弧，并指定半径和角度差。
  mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 向路径添加一个圆角矩形。
  mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular, transform: CGAffineTransform = .identity)
  ```

* ```swift
  // 返回通过将变换应用于路径的所有点而构造的路径
  func applying(_ transform: CGAffineTransform) -> Path
  ```

* ```swift
  // 关闭并完成当前子路径。
  mutating func closeSubpath()
  ```

* ```swift
  // 如果路径包含指定点，则返回true。
  // 如果eoFill为true，则此方法使用奇偶规则定义路径内的点。否则，它使用非零规则
  func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool
  ```



## Transformed Shapes

### ScaledShape

对其父级 `View` 应用了比例转换后的形状。

```swift
@frozen struct ScaledShape<Content> where Content : Shape
```

#### Initialize

```swift
// shape 应用的形状类型、scale 为缩放比例、anchor指定其所在的位置
init(shape: Content, scale: CGSize, anchor: UnitPoint = .center)
```

#### Instance Properties

```swift
var anchor: UnitPoint

var animatableData: AnimatablePair<Content.AnimatableData, AnimatablePair<CGSize.AnimatableData, UnitPoint.AnimatableData>> { get set }

var scale: CGSize

var shape: Content
```



### RotatedShape

将 `Shape` 应用旋转变换后的形状。

```swift
@frozen struct RotatedShape<Content> where Content : Shape
```

#### Initialize

```swift
// shape 应用的形状类型、angle 为旋转角度、anchor指定其所在的位置
init(shape: Content, angle: Angle, anchor: UnitPoint = .center)
```

#### Instance Properties

```swift
var anchor: UnitPoint

var animatableData: RotatedShape<Content>.AnimatableData { get set }

var angle: Angle

var shape: Content
```



### OffsetShape

将 `Shape` 应用平移偏移变换的形状。

```swift
@frozen struct OffsetShape<Content> where Content : Shape
```

#### Initialize

```swift
// shape 应用的形状类型、offset 指定其偏移的位置
init(shape: Content, offset: CGSize)
```

#### Instance Properties

```swift
var animatableData: OffsetShape<Content>.AnimatableData { get set }

var offset: CGSize

var shape: Content
```



### TransformedShape

将 `Shape` 应用仿射变换的形状。

```swift
@frozen struct TransformedShape<Content> where Content : Shape
```

#### Initialize

```swift
// shape 应用的形状类型、offset 指定放射变换
init(shape: Content, transform: CGAffineTransform)
```

#### Instance Properties

```swift
var animatableData: TransformedShape<Content>.AnimatableData { get set }

// 仅当 AnimatableData 为 EmptyAnimatableData 
var animatableData: EmptyAnimatableData { get set }

var transform: CGAffineTransform

var shape: Content
```



## Paints, Style, and Gradients

### ShapeStyle

将形状变成视图的方法。

我们可以在 `View Modifiers` 中找到使用该协议的相关方法。

#### Conforming Types

- [`AngularGradient`](apple-reference-documentation://hsCwDUIclD)
- [`ImagePaint`](apple-reference-documentation://hs2-ZvzqXv)
- [`LinearGradient`](apple-reference-documentation://hsnEF1MpPh)
- [`RadialGradient`](apple-reference-documentation://hsgGykCOCl)
- [`SelectionShapeStyle`](apple-reference-documentation://hs-7Hqe9I7)
- [`SeparatorShapeStyle`](apple-reference-documentation://hscoeH9aei)

### Color

与环境有关的颜色。

颜色是一个后期绑定令牌：SwiftUI仅在将其在给定环境中使用之前将其解析为具体值。

```swift
@frozen struct Color
```

#### Initialize

```swift
init(_ color: UIColor)

init(_ color: NSColor)

init(_ name: String, bundle: Bundle? = nil)

init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1)

init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1)

init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1)
```



### ImagePaint

在无限平面上重复图像的绘画类型。

```swift
@frozen struct ImagePaint
```

#### Initialize

```swift
init(image: Image, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1)
```

#### Instance Properties

```swift
var image: Image

var scale: CGFloat

var sourceRect: CGRect
```



### Gradient

表示为色标阵列的色阶，每个色阶都有一个参数位置值。

```swift
@frozen struct Gradient
```

#### Initializers

```swift
init(colors: [Color])

init(stops: [Gradient.Stop])
```

#### Instance Properties

```swift
var stops: [Gradient.Stop]
```



### LinearGradient

线性渐变

```swift
@frozen struct LinearGradient
```

#### Initializers

```swift
init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint)
```



### AngularGradient

角度渐变。

角度梯度也称为“圆锥形”梯度。当角度相对于中心点以及定义的起始角度和结束角度变化时，此渐变会应用颜色功能。如果 `endAngle` - `startAngle` > 2π，则渐变仅绘制最后一个完整的转弯。如果`endAngle` - `startAngle`  <2π，则渐变将用渐变位置1和0定义的颜色填充缺失的区域，在缺失区域的中途在两者之间过渡。渐变将单位空间的中心点映射到每个用渐变填充的形状的边界矩形中。

```swift
@frozen struct AngularGradient
```

#### Initializers

```swift
init(gradient: Gradient, center: UnitPoint, angle: Angle = .zero)

init(gradient: Gradient, center: UnitPoint, startAngle: Angle = .zero, endAngle: Angle = .zero)
```



### RadialGradient

放射状渐变

渐变将颜色函数应用为距中心点的距离，并按比例缩放以适合定义的起点和终点半径。渐变将单位空间的中心点映射到每个用渐变填充的形状的边界矩形中

```swift
@frozen struct RadialGradient
```

#### Initializers

```swift
init(gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)
```



## Geometry

### GeometryReader

一个容器视图，根据其自身大小和坐标空间定义其内容。

```swift
@frozen struct GeometryReader<Content> where Content : View
```

#### Initializers

```swift
init(@ViewBuilder content: @escaping (GeometryProxy) -> Content)
```

#### Instance Properties

```swift
var content: (GeometryProxy) -> Content
```





