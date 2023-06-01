`.font`

![Screenshot 2023-06-01 at 7 35 38 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/0f3cfcd2-c192-4a52-9d71-90a74b34ea47)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Miles and Floating Godzilla")
                .font(.system(.title, weight: .ultraLight))
            HStack {
                Text("Miles Phan")
                    .font(.system(.headline, weight: .semibold))
                Text("(2019)")
                    .font(.system(.headline, weight: .ultraLight))
            }
        }
        .padding()
        .background(.blue.opacity(0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
