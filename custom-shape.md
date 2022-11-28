# Using `Path` and `GeometryReader` to Draw Custom Shapes

## 1. Center Custom Shape in Parent View 

> Note: The Custom Shape is centered in Parent View using `GeometryReader`. 

<img width="1306" alt="Screen Shot 2022-11-27 at 3 50 16 PM" src="https://user-images.githubusercontent.com/1819208/204159057-83958222-b150-498a-ae93-7dcfeb4ad0a6.png">


try? it out 

```swift
import SwiftUI

struct CustomShape: View {
    let width: CGFloat
    let height: CGFloat
    let color: Color

    var body: some View {
        GeometryReader { geometry in
            let itemSize: CGSize = CGSize(width: width, height: height)
            Path { path in
                path.addRect(
                    CGRect(
                        x: geometry.size.width/2 - itemSize.width/2,
                        y: geometry.size.height/2 - itemSize.height/2,
                        width: itemSize.width,
                        height: itemSize.height
                    )
                )
            }
            .fill(color)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                CustomShape(
                    width: geometry.size.width * 0.50,
                    height: geometry.size.height * 0.50,
                    color: .blue
                )
            }
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

*** 

## 2. Align Custom Shape at the bottom right of it's Parent 

<img width="1357" alt="Screen Shot 2022-11-27 at 4 12 29 PM" src="https://user-images.githubusercontent.com/1819208/204160029-044bb787-9354-4910-8c40-a05fc04efda8.png">

try? it out 

```swift 
import SwiftUI

struct CustomShape: View {
    let width: CGFloat
    let height: CGFloat
    let color: Color

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: width * 0.10,
                                      y: height * 0.50))
                path.addLine(to: CGPoint(x: width,
                                         y: height * 0.50))
                path.addLine(to: CGPoint(x: width,
                                         y: height))
                path.addLine(to: CGPoint(x: width * 0.10,
                                         y: height))
                path.closeSubpath()
            }
            .fill(color)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                CustomShape(
                    width: width,
                    height: height,
                    color: .blue
                )
            }
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 3. Custon Shape with a left corner drawn 


![top-left-corner](https://user-images.githubusercontent.com/1819208/204168148-78f89cee-50d5-42bc-bc68-d82af53c433a.jpg)


<img width="1363" alt="Screen Shot 2022-11-27 at 7 20 08 PM" src="https://user-images.githubusercontent.com/1819208/204167907-8482b630-b37c-4d88-940c-446d566c94a8.png">


try? it out 

```swift
import SwiftUI

struct CustomShape: View {
    let width: CGFloat
    let height: CGFloat
    let radius: CGFloat
    let color: Color

    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        GeometryReader { geometry in
            let startPoint = CGPoint(
                x: radius,
                y: 0
            )
            let endPoint = CGPoint(
                x: (startPoint.x - radius),
                y: radius
            )
            Path { path in
                // 1
                path.move(to: startPoint)
                // 2
                // top right point
                path.addLine(to: CGPoint(x: width,
                                         y: 0))
                // 3
                // bottom right point
                path.addLine(to: CGPoint(x: width,
                                         y: height))
                // 4
                // bottom left point
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: height))
                // 5
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: radius))
                // 6
                // rounded corner at top left
                path.addCurve(to: startPoint,
                              control1: CGPoint(x: endPoint.x,
                                                y: endPoint.y),
                              control2: CGPoint(x: startPoint.x - radius,
                                                y: startPoint.y))

                // 7
                // optional
                path.closeSubpath()
            }
            .fill(color)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                CustomShape(
                    width: width,
                    height: height,
                    radius: 60,
                    color: .blue
                )
            }
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 4. Usinga a Custom SwiftUI View as a `background` modifier 

<img width="1374" alt="Screen Shot 2022-11-27 at 7 47 21 PM" src="https://user-images.githubusercontent.com/1819208/204169645-7ff47ec4-59ef-4546-830c-939e82c8b0d5.png">

try? it out 

```swift
import SwiftUI

struct CustomShape: View {
    let width: CGFloat
    let height: CGFloat
    let radius: CGFloat
    let color: Color

    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        GeometryReader { geometry in
            let startPoint = CGPoint(
                x: radius,
                y: 0
            )
            let endPoint = CGPoint(
                x: (startPoint.x - radius),
                y: radius
            )
            Path { path in
                // 1
                path.move(to: startPoint)
                // 2
                // top right point
                path.addLine(to: CGPoint(x: width,
                                         y: 0))
                // 3
                // bottom right point
                path.addLine(to: CGPoint(x: width,
                                         y: height))
                // 4
                // bottom left point
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: height))
                // 5
                path.addLine(to: CGPoint(x: endPoint.x,
                                         y: radius))
                // 6
                // rounded corner at top left
                path.addCurve(to: startPoint,
                              control1: CGPoint(x: endPoint.x,
                                                y: endPoint.y),
                              control2: CGPoint(x: startPoint.x - radius,
                                                y: startPoint.y))

                // 7
                // optional
                path.closeSubpath()
            }
            .fill(color)
        }
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = 300
            let height: CGFloat = 100
            VStack {
                Image("swiftui-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                VStack {
                    Text("Using a SwiftUI Custom View as a `background` modifier")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .frame(height: height)
                .frame(width: width)
                .background(
                    CustomShape(
                        width: width,
                        height: height,
                        radius: 40,
                        color: .swiftyBlue
                    )
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let swiftyBlue = Color(red: 5/255, green: 23/255, blue: 142/255)
}
```
