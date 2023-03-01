# TextField 

![Screen Shot 2023-03-01 at 6 42 18 PM](https://user-images.githubusercontent.com/1819208/222292240-f164411c-114c-4328-9f1a-abb4b7189d48.png)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Please enter your username", text: $username)
            SecureField("Please enter your password", text: $password)
        }
        .frame(width: 300)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .autocapitalization(.none)
        .autocorrectionDisabled(true)
        .padding(20)
        .background(.teal)
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Resources

* [Apple docs: `TextField`](https://developer.apple.com/documentation/swiftui/textfield)
