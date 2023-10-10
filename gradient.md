# Adding a Gradeint View 

![Screenshot 2023-10-10 at 7 06 16 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/8ecc68a4-99f8-4c8c-95a9-afb2424054cb)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {}) {
            Text("Press to confirm your flight")
                .padding(20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .background(
            RoundedRectangle(cornerRadius: 100)
                .overlay(
                    LinearGradient(colors: [.red, .green, .yellow], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 100)
                )
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}
```
