# Path

Bezier curves allow us to perform custom drawings in iOS. `Path` available in SwiftUI is similar to `UIBezierPath` to UIKit and is the API that allows for this drawing customization. Below are some starter sample code to get you started with custom drawing of paths and curves.

## 1. Drawig a Line using `addLine`

![Screen Shot 2022-11-12 at 10 27 38 AM](https://user-images.githubusercontent.com/1819208/201481342-9eea8dd0-e30c-4590-9b7e-d439495a25ac.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = width
            Path { path in
                // start point
                path.move(to: CGPoint(x: 40, y: 300))
                // endpoint
                path.addCurve(to: CGPoint(x: width - 40, y: 300),
                              // control point above line
                              control1: CGPoint(x: width * 0.6, y: 200),
                              // control point below line
                              control2: CGPoint(x: width * 0.5, y: 400))
            }
            .stroke(.black, lineWidth: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## 2. Drawing a Quad Curve using `addQuadCurve`

> A Quad Curve has one `control` point. As seen below we choose a `control` point midway between the starting and ending point and above to get this desired curve. Feel free to adjust the `control` point and see how the shape behaves.

![Screen Shot 2022-11-12 at 10 33 30 AM](https://user-images.githubusercontent.com/1819208/201481627-1a4f97a8-df14-4bba-8165-4f6396f43213.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = width
            Path { path in
                // start point
                path.move(to: CGPoint(x: 40, y: 300))
                // endpoint
                path.addQuadCurve(to: CGPoint(x: width - 40, y: 300),
                                  control: CGPoint(x: width * 0.5, y: 50))
            }
            .stroke(.black, lineWidth: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

****

## 3. Drawing a Curve using `addCurve`

> A Curve has two `control` points. As seen below we choose a `control` point above and below the start and the end points to create the desired curve. 

![Screen Shot 2022-11-12 at 10 24 02 AM](https://user-images.githubusercontent.com/1819208/201481175-e1c02cfb-6888-477d-bded-3e8eedb1f8b1.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = width
            Path { path in
                // start point
                path.move(to: CGPoint(x: 40, y: 300))
                // endpoint
                path.addCurve(to: CGPoint(x: width - 40, y: 300),
                              // control point above line
                              control1: CGPoint(x: width * 0.6, y: 200),
                              // control point below line
                              control2: CGPoint(x: width * 0.5, y: 400))
            }
            .stroke(.black, lineWidth: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 4. Drawing a Tooltip Container

![Screen Shot 2022-11-12 at 11 19 26 AM](https://user-images.githubusercontent.com/1819208/201483845-655dcab9-b0bf-41ce-8732-4f678739ca99.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = width
            Path { path in
                // start point
                path.move(to: CGPoint(x: 40, y: 300))
                // top right point
                path.addLine(to: CGPoint(x: width - 40, y: 300))
                // bottom right point
                path.addLine(to: CGPoint(x: width - 40, y: 400))
                // right of point
                path.addLine(to: CGPoint(x: width - 60, y: 400))
                // bottom of point
                path.addLine(to: CGPoint(x: width - 80, y: 440))
                // left of point
                path.addLine(to: CGPoint(x: width - 80, y: 400))
                // bottom left
                path.addLine(to: CGPoint(x: 40, y: 400))
                // close path
                path.closeSubpath()
            }
            .stroke(.black, lineWidth: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 5. Drawing a Tooltip with embedded `Text`

iPhone

![iphone-tooltip](https://user-images.githubusercontent.com/1819208/201485699-d1eabe1b-9f44-42eb-bce6-6021dd33f7f8.png)

iPad

![ipad-tooltip](https://user-images.githubusercontent.com/1819208/201485705-fb78ef67-35da-4d88-a13a-49bc66d1426b.png)

try? it out 

```swift
import SwiftUI

struct Tooltip: View {
    let headline: String
    let subheadline: String

    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            VStack {
                ZStack {
                    Path { path in
                        // start point
                        path.move(to: CGPoint(x: 40, y: height * 0.40))
                        // top right point
                        path.addLine(to: CGPoint(x: width - 40, y: height * 0.40))
                        // bottom right point
                        path.addLine(to: CGPoint(x: width - 40, y: height * 0.60))
                        // right of point
                        path.addLine(to: CGPoint(x: width - 60, y: height * 0.60))
                        // bottom of point
                        path.addLine(to: CGPoint(x: width - 70, y: height * 0.70))
                        // left of point
                        path.addLine(to: CGPoint(x: width - 100, y: height * 0.60))
                        // bottom left
                        path.addLine(to: CGPoint(x: 40, y: height * 0.60))
                        // close path
                        path.closeSubpath()
                    }
                    .fill(.yellow)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(headline)
                            .font(.headline)
                        Text(subheadline)
                            .font(.subheadline)
                    }
                    .frame(width: sizeClass == .regular ? nil : 300)
                    .background(.orange)
                }
            }
        }
        .frame(height: 500)
    }
}

struct ContentView: View {
    private let headline = "Welcome to Wakanda"
    private let subheadline = "Switch between multiple roles by clicking on your profile button."

    private enum Constants {
        static let buttonSize: Double = 80
    }

    var body: some View {
        VStack {
            Spacer()
            Tooltip(
                headline: headline,
                subheadline: subheadline
            )
            .frame(height: 200)
            .background(.ultraThinMaterial)
            HStack {
                Spacer()
                Button(action: {}) {
                    Image("wakanda")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.buttonSize, height: Constants.buttonSize)
                        .background(Color(uiColor: .systemGray4))
                        .foregroundColor(.black)
                        .cornerRadius(Constants.buttonSize/2)
                }
            }
            .padding(.trailing, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Apple docs: https://developer.apple.com/documentation/swiftui/view/previewdevice(_:)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            .previewDisplayName("iPad Pro 12.9-inch 5th Gen")
    }
}
```

***

## 6. Drawing a Hexagon 

Hexagon drawing details 

![Screen Shot 2022-11-12 at 8 31 07 PM](https://user-images.githubusercontent.com/1819208/201504941-8bca9fe2-7fd6-41a8-ac54-6d10c7c69522.jpg)

Hexagon 

![Screen Shot 2022-11-12 at 8 40 49 PM](https://user-images.githubusercontent.com/1819208/201501501-67e8726a-458c-4a9b-a4d3-9caeb362f9b3.png)


try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let center = CGPoint(x: width/2, y: height/2)
            let size: CGFloat = width * 0.75
            let half = size / 2
            let quarter = size / 4
            VStack {
                Path { path in
                    // left
                    path.move(to: CGPoint(x: center.x - half, y: center.y))
                    // top left
                    path.addLine(to: CGPoint(x: center.x - quarter, y: center.y - half))
                    // top right
                    path.addLine(to: CGPoint(x: center.x + quarter, y: center.y - half))
                    // right
                    path.addLine(to: CGPoint(x: center.x + half, y: center.y))
                    // bottom right
                    path.addLine(to: CGPoint(x: center.x + quarter, y: center.y + half))
                    // bottom left
                    path.addLine(to: CGPoint(x: center.x - quarter, y: center.y + half))
                    // close the path
                    path.closeSubpath()
                }
                .fill(.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 7. Drawing a Rounded Tooltip

> To get the smooth rounded corners in this tooltip we make use of `addCurve` which takes a `to:` point and two `control` points. We keep the `y` coordinates for the `control` points on the same plain as the `y` top and bottom values accordingly. For the `x` value we give it an `adjustment` value.

![Screen Shot 2022-11-13 at 5 09 46 PM](https://user-images.githubusercontent.com/1819208/201547065-e24f9127-fc79-41dc-b04d-0c53ca1b8bc4.png)

try? it out 

```swift
import SwiftUI

struct RoundedTooltip: View {
    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width/2,
                                y: geometry.size.height/2)
            let width = geometry.size.width
            let containerLength = width * 0.60
            let containerHeight: CGFloat = 60
            let adjustment: CGFloat = 60
            Path { path in
                // start point
                path.move(to: CGPoint(x: center.x - (containerLength/2),
                                      y: center.y - containerHeight/2))
                // top line
                path.addLine(to: CGPoint(x: center.x + (containerLength/2),
                                         y: center.y - containerHeight/2))
                // right curve
                path.addCurve(to: CGPoint(x: center.x + (containerLength/2),
                                          y: center.y + containerHeight),
                              control1: CGPoint(x: center.x + (containerLength/2) + adjustment,
                                                y: center.y - containerHeight/2),
                              control2: CGPoint(x: center.x + (containerLength/2) + adjustment,
                                                y: center.y + containerHeight))
                // bottom line at right of point
                path.addLine(to: CGPoint(x: center.x + 100,
                                         y: center.y + containerHeight))
                // bottom of point
                path.addLine(to: CGPoint(x: center.x + 80,
                                         y: center.y + 100))
                // left of point
                path.addLine(to: CGPoint(x: center.x + 70,
                                         y: center.y + containerHeight))
                // bottom line left of point
                path.addLine(to: CGPoint(x: center.x - (containerLength/2),
                                         y: center.y + containerHeight))
                // left curve
                path.addCurve(to: CGPoint(x: center.x - (containerLength/2),
                                          y: center.y - containerHeight/2),
                              control1: CGPoint(x: center.x - (containerLength/2) - adjustment,
                                                y: center.y + containerHeight),
                              control2: CGPoint(x: center.x - (containerLength/2) - adjustment,
                                                y: center.y - containerHeight/2))
            }
            .stroke(.black, lineWidth: 4)
            Text("Welcome to our app experience. Check out our this new feature.")
                .frame(width: 200)
                .position(x: geometry.size.width/2,
                          y: geometry.size.height/2
                )
                .offset(y: 8)
        }
        .frame(height: 200)
        .ignoresSafeArea(.all)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            RoundedTooltip()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Resources 

* [Apple docs: `Path`](https://developer.apple.com/documentation/swiftui/path)
* [Apple SwiftUI Tutorials: Drawing Paths and Shapes](https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes)
* [Bezier Curve](https://javascript.info/bezier-curve)
