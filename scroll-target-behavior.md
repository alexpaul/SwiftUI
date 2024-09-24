# Scroll Target Behavior

> Note: Avaiable in iOS 17+

<img width="1373" alt="Screenshot 2024-09-24 at 5 10 15 PM" src="https://github.com/user-attachments/assets/3961cccb-1a04-4c25-bdf0-cf547e2630fe">

try? it out 

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10, id: \.self) { item in
                    VStack {
                        Text(item.description)
                    }
                    .frame(width: 200, height: 300)
                    .background(.teal)
                    .clipShape(.rect(cornerRadius: 16))
                }
            }
        }
        .scrollTargetBehavior(.paging) // available in iOS 17+
    }
}

#Preview {
    ContentView()
}
```
