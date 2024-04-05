# Button 

![Screenshot 2024-04-05 at 12 38 09 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/afb8d22f-f6be-44f2-9bbc-b47f08820914)

try? it out

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            // perform action here
        } label: {
            Text("Press for SwiftUI")
                .foregroundStyle(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(.blue, in: RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
```

## Resources

* [Apple docs: Button](https://developer.apple.com/documentation/swiftui/button)
