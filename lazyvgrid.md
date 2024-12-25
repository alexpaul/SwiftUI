# LazyVGrid

<img width="1376" alt="Screenshot 2024-12-25 at 10 22 11 AM" src="https://github.com/user-attachments/assets/d46e1765-d0a1-450c-9b71-1f63cb3de03e" />


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
