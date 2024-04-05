# Button 

![Screenshot 2024-04-05 at 12 34 31 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/31879c33-f41c-434a-8811-871b25846f9e)


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
