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

## 4. Drawing a Tooltip

<img width="1293" alt="Screen Shot 2022-11-11 at 6 04 22 PM" src="https://user-images.githubusercontent.com/1819208/201442582-1cedd47d-4604-4b33-b02d-dbc73328a792.png">

try? it out 

```swift
import SwiftUI

struct Tooltip: View {
    let headline: String
    let subheadline: String

    var body: some View {
        ZStack {
            Path { path in
                // starting point
                path.move(
                    to: CGPoint(
                        x: 20,
                        y: 50)
                )
                // top right
                path.addLine(
                    to: CGPoint(
                        x: 370,
                        y: 50
                    )
                )
                // bottom right
                path.addLine(
                    to: CGPoint(
                        x: 370,
                        y: 150
                    )
                )
                // right of pointer
                path.addLine(
                    to: CGPoint(
                        x: 360,
                        y: 150
                    )
                )
                // botton of pointer
                path.addLine(
                    to: CGPoint(
                        x: 334,
                        y: 190
                    )
                )
                // left of pointer
                path.addLine(
                    to: CGPoint(
                        x: 320,
                        y: 150
                    )
                )
                // bottom left
                path.addLine(
                    to: CGPoint(
                        x: 20,
                        y: 150
                    )
                )
                path.closeSubpath()
            }
            .fill(.yellow)
            .frame(minHeight: 200)
            VStack(alignment: .leading, spacing: 4) {
                Text(headline)
                    .font(.headline)
                Text(subheadline)
                    .font(.subheadline)
            }
            .frame(width: 300)
        }
        .frame(height: 100)
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
            .padding(.bottom, 40)
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
        ContentView()
    }
}
```

***

## Resources 

* [Apple docs: `Path`](https://developer.apple.com/documentation/swiftui/path)
* [Apple SwiftUI Tutorials: Drawing Paths and Shapes](https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes)
* [Bezier Curve](https://javascript.info/bezier-curve)
