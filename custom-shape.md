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
