# ViewModifier

![Screen Shot 2023-01-07 at 6 04 13 PM](https://user-images.githubusercontent.com/1819208/211173435-0ef96410-2ec3-409b-920b-ca09c9ec44ec.png)

try? it out 

```swift
import SwiftUI

struct BorderedCaption: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(color)
    }
}

// You can apply `.modifier` directly to a View
// but a more idiomatic way is to define an
// `extension` on `View` itself
extension View {
    func borderedCaption(color: Color = .blue) -> some View {
        modifier(BorderedCaption(color: color))
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "bus")
                .resizable()
                .frame(width: 50, height: 50)
            Text("MTA Bus")
                .borderedCaption(color: .red)

                // You can apply `.modifier` directly to a View
                // but a more idiomatic way is to define an
                // `extension` on `View` itself
                // .modifier(BorderedCaption())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources

* [Apple docs: `ViewModifier`](https://developer.apple.com/documentation/swiftui/viewmodifier)
