# ButtonStyle 

![Screen Shot 2023-02-15 at 12 38 02 PM](https://user-images.githubusercontent.com/1819208/219109509-89baae81-391d-4175-a206-5c3ba8e00bdc.png)

try? it out 

```swift
import SwiftUI

struct SelectedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? .blue : .clear)
            .foregroundColor(configuration.isPressed ? .white : .blue)
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(.blue, lineWidth: 1)
            }
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: {}) {
            Text("SwiftUI")
        }
        .buttonStyle(SelectedButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
