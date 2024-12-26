# Aspect Ratio

![Screenshot 2024-12-26 at 1 00 10 PM](https://github.com/user-attachments/assets/029b3183-9fd8-45de-b975-0b6e2238829e)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(lineWidth: 2)
            .padding()
            .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }
}

#Preview {
    ContentView()
}
```
