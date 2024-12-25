# LazyVGrid

<img width="1398" alt="Screenshot 2024-12-25 at 10 24 05 AM" src="https://github.com/user-attachments/assets/ed2e1a78-f84b-4b69-8305-aaf2a03f0ff4" />

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            cards
        }
        .scrollIndicators(.hidden)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0..<10, id: \.self) { index in
                card
            }
        }
        .padding()
    }

    var card: some View {
        RoundedRectangle(cornerRadius: 12)
            .aspectRatio(2/3, contentMode: .fit)
            .foregroundStyle(.teal)
    }
}

#Preview {
    ContentView()
}
```
