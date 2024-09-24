# Scroll Target Behavior

> Note: Avaiable in iOS 17+

## Example 1

<img width="1373" alt="Screenshot 2024-09-24 at 5 10 15 PM" src="https://github.com/user-attachments/assets/3961cccb-1a04-4c25-bdf0-cf547e2630fe">

try? it out 

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10, id: \.self) { item in
                    VStack {
                        Text(item.description)
                    }
                    .frame(width: 200, height: 300)
                    .background(.teal)
                    .clipShape(.rect(cornerRadius: 16))
                }
            }
        }
        .scrollTargetBehavior(.paging) // available in iOS 17+
    }
}

#Preview {
    ContentView()
}
```

***

## Example 2

![Screenshot 2024-09-24 at 5 57 39 PM](https://github.com/user-attachments/assets/f03efcce-c130-4ed6-8608-8ca473cbbfd9)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    private let pageWidth: CGFloat = 300

    var body: some View {
        GeometryReader { geometry in
            let geometryWidth = geometry.size.width
            let geometryHeight = geometry.size.height
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<10, id: \.self) { item in
                        VStack {
                            Text("\(item + 1)")
                        }
                        .frame(width: pageWidth, height: 400)
                        .background(.teal)
                        .clipShape(.rect(cornerRadius: 16))
                        .padding(
                            .horizontal,
                            (geometryWidth - pageWidth) / 2
                        )
                    }
                }
            }
            .position(x: geometryWidth / 2, y: geometryHeight / 2)
            .scrollTargetBehavior(.paging) // available in iOS 17+
        }
    }
}

#Preview {
    ContentView()
}
```

***

## Resources 

* [`ScrollTargetBehavior`](https://developer.apple.com/documentation/swiftui/scrolltargetbehavior)
