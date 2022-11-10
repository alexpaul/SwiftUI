# Dark Mode Support 

![Screen Shot 2022-10-31 at 4 37 14 PM](https://user-images.githubusercontent.com/1819208/199105765-a4702f12-85df-4f21-b446-a1972ce1cc47.png)


try? it out

```swift
import SwiftUI

struct ContentView: View {

    // Apple docs:
    // https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text(colorScheme == .dark ? "Dark" : "Light")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources 

* [Apple docs: `colorScheme` of the Environment](https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme)
* [Apple docs: EnvironmentValues](https://developer.apple.com/documentation/swiftui/environmentvalues)
