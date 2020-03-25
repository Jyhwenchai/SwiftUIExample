# View Layout and Presentation



## HStack

```swift
@frozen struct HStack<Content> where Content : View
```

### Initialize

* ```swift
  init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, content: () -> Content)
  ```



## VStack

```swift
@frozen struct VStack<Content> where Content : View
```

### Initialize

* ```swift
  init(alignment: HerticalAlignment = .center, spacing: CGFloat? = nil, content: () -> Content)
  ```



## VStack

```swift
@frozen struct ZStack<Content> where Content : View
```

### Initialize

* ```swift
  init(alignment: Alignment = .center, content: () -> Content)
  ```



## List

```swift
struct List<SelectionValue, Content> where SelectionValue : Hashable, Content : View
```

**Parameters**

- `data`

  The data for populating the list.

- `id`

  The key path to the data model’s identifier.

- `selection`

  A binding to a set that identifies selected rows.

- `rowContent`

  A view builder that creates the view for a single row of the list.

### Initialize

* ```swift
  init(content: () -> Content)
  ```

* ```swift
  init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
  ```

* ```swift
  init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
  ```

* ```swift
  init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View
  ```

* ```swift
  init<RowContent>(_ data: Range<Int>, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
  ```

* ```swift
  init<Data, RowContent>(_ data: Data, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
  ```

* ```swift
  init<RowContent>(_ data: Range<Int>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
  ```

* ```swift
  init<RowContent>(_ data: Range<Int>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
  ```

* ```swift
  init<Data, RowContent>(_ data: Data, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
  ```

* ```swift
  init<Data, RowContent>(_ data: Data, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable
  ```

* ```swift
  init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content)
  ```

* ```swift
  init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content)
  ```



## ForEach

```swift
struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable
```

### Initialize

* ```swift
  init(_ data: Data, content: @escaping (Data.Element) -> Content)
  ```

* ```swift
  init(_ data: Range<Int>, content: @escaping (Int) -> Content)
  ```

* ```swift
  init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content)
  ```

### 执行动作

* ```swift
  func onDelete(perform action: Optional<(IndexSet) -> Void>) -> some DynamicViewContent
  ```

* ```swift
  func onInsert(of acceptedTypeIdentifiers: [String], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent
  ```

* ```swift
  func onMove(perform action: Optional<(IndexSet, Int) -> Void>) -> some DynamicViewContent
  ```



## ScrollView

```swift
struct ScrollView<Content> where Content : View
```

### Initialize

```swift
init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content)
```



## From

```swift
struct Form<Content> where Content : View
```

### Initialize

```swift
init(@ViewBuilder content: () -> Content)
```



## Group

```swift
@frozen struct Group<Content>
```

### Initialize

```swift
init(@ViewBuilder content: () -> Content)
```



## Section

```swift
struct Section<Parent, Content, Footer>
```

### Initialize

* ```swift
  init(@ViewBuilder content: () -> Content)
  ```

* ```swift
  init(footer: Footer, @ViewBuilder content: () -> Content)
  ```

* ```swift
  init(header: Parent, @ViewBuilder content: () -> Content)
  ```

* ```swift
  init(header: Parent, footer: Footer, @ViewBuilder content: () -> Content)
  ```



## Spacer

```swift
@frozen struct Spacer
```

### Initialize

```swift
init(minLength: CGFloat? = nil)
```



## Divider

产生一条分割线，用与分隔视图控件间的分隔。

```swift
struct Divider
```



## NavigationView

```swift
struct NavigationView<Content> where Content : View
```

### Initialize

```swift
init(@ViewBuilder content: () -> Content)
```



## TabView

`SelectionValue` 为 `Int` 是有效。

```swift
struct TabView<SelectionValue, Content> where SelectionValue : Hashable, Content : View
```

### Initialize

* ```swift
  init(@ViewBuilder content: () -> Content)
  ```

* ```swift
  init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)
  ```



## Alert

```swift
struct Alert
```

### Initialize

* ```swift
  init(title: Text, message: Text? = nil, primaryButton: Alert.Button, secondaryButton: Alert.Button)
  ```

* ```swift
  init(title: Text, message: Text? = nil, dismissButton: Alert.Button? = nil)
  ```



## ActionSheet

```swift
struct ActionSheet
```

### Initialize

```swift
init(title: Text, message: Text? = nil, buttons: [ActionSheet.Button] = [.cancel()])
```



## AnyView

将包裹的视图类型进行类型擦除

```swift
@frozen struct AnyView
```

### Initialize

```swift
init<V>(_ view: V) where V : View
```



## TupleView

通过元组来初始化一组视图

```swift
@frozen struct TupleView<T>
```

### Initialize

```swift
init(_ value: T)
```

