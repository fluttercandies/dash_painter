# dash_painter

a package for flutter canvas paint dash line path easily.

#### 1. `DashPainter` 如何使用

`DashPainter` 只负责对 `路径 Path` 的虚线化绘制，不承担组件职能。
一般用在拥有 `Canvas` 对象的回调方法中，比如自定义的 `CustomPainter`、`Decoration`。
具体使用案例见 demo

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210509210035976.png)

```dart
const DashPainter(span: 4, step: 9).paint(canvas, path, paint);
```

对于所有的路径都是使用的，如下的 `圆角矩形` 和 `圆形`；

| 圆角矩形                                                     | 圆形                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510070700102.png) | ![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210509211922128.png) |

---

#### 2. 点划线的使用


除了虚线，还可以绘制`点划线` , `pointCount` 和 `pointWidth`两个属性，分别表示`点划线数`和`点划线长`。

```dart
const DashPainter(
    span: 4, // 空格长
    step: 10, // 实线长
    pointCount: 2, // 点划线个数
    pointWidth: 2 // 点划线长
).paint(canvas, path, paint);
```

- `单点划线`：

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510070923020.png)

- `双点划线`：

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510071049769.png)

- `三点划线`：

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510071131986.png)

---

`点画线圆`：

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510072143441.png)

---

#### `DashPainter`

可能很多人不会自定义画板自己绘制，或只想简单地使用。其实除了 `CustomPainter` 还有其他地方有 `canvas`。比如 `Decoration` 。
这里提供了 `DashDecoration` 的装饰，方便使用。如下实现一个`渐变的单点画线圆角虚线框`。

![](https://gitee.com/toly1994/toly_blog_pic/raw/master/image-20210510091605411.png)

```dart
Container(
  width: 100,
  height: 100,
  decoration: DashDecoration(
      pointWidth: 2,
      step: 5,
      pointCount: 1,
      radius: Radius.circular(15),
      gradient: SweepGradient(colors: [
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.green
      ])),
  child: Icon(
    Icons.add,
    color: Colors.orangeAccent,
    size: 40,
  ),
),
```