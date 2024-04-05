# Button 

![Screenshot 2024-04-05 at 12 36 05 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/a4592d25-1189-4bf3-8579-f037d0e51a58)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {

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
