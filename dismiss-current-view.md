# Dismiss Current View 

![Screen Shot 2022-10-31 at 4 49 54 PM](https://user-images.githubusercontent.com/1819208/199107980-fc918eaf-725a-4576-9d9f-b8d1a385547a.png)

try? it out

```swift
import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var isSheetPresented = false

    var body: some View {
        Button("Show Detail View") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            DetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources

* [Apple docs: `dismiss` EnvironmentValue](https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss)
* [Apple docs: EnvironmentValues](https://developer.apple.com/documentation/swiftui/environmentvalues)
