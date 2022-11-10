# `TextField` and `safeAreaInset`

![Screen Shot 2022-11-10 at 12 29 53 PM](https://user-images.githubusercontent.com/1819208/201165892-26f099fa-218a-44bb-a7d6-1d4788789a45.png)

try? it out

```swift
import SwiftUI

struct ContentView: View {
    @State private var messages = [String]()
    @State private var text = ""

    var body: some View {
        VStack {
            List(messages, id: \.self) { message in
                Text(message)
            }
            // Apple docs: https://developer.apple.com/documentation/swiftui/view/safeareainset(edge:alignment:spacing:content:)-6gwby
            .safeAreaInset(edge: .bottom) {
                // Apple docs: https://developer.apple.com/documentation/swiftui/textfield
                TextField(text: $text) {
                    Text("Type your message here")
                }
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    messages.append(text)
                    text = ""
                }
                .padding()
                .background(Color(uiColor: .systemGray4))
            }
        }
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
* [Apple docs: `safeAreaInset`](https://developer.apple.com/documentation/swiftui/view/safeareainset(edge:alignment:spacing:content:)-6gwby)
* [Natalia Panferova's Implementtion via Twitter](https://twitter.com/natpanferova/status/1590676836488732678?s=20&t=rLSdUHNOAi9iRUfybiSnSA)
