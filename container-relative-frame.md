# Conatiner

## Using `containerRelativeFrame`

![Screenshot 2024-06-16 at 9 27 43 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/f9d08799-6f03-4cb2-ac6f-04050f497842)

try? it out 

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.orange)
                .containerRelativeFrame(.vertical) { height, _ in
                    height / 2
                }
        }
    }
}

#Preview {
    ContentView()
}
```

## Resources 

* [`containerRelativeFrame(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/containerrelativeframe(_:alignment:)?changes=_5)
