# `Button`s in an `HStack` with Dynamic Type Support

![Screen Shot 2022-10-31 at 2 20 56 PM](https://user-images.githubusercontent.com/1819208/199081472-3ebbf7ea-7c6b-497f-8b19-d43f1687f167.png)

![Screen Shot 2022-10-31 at 2 20 01 PM](https://user-images.githubusercontent.com/1819208/199081504-350dd8d1-3ccd-40ca-9c33-8efb1d75de53.png)


try? it out

```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            buttonsView("Your Orders", "Buy Again")
            buttonsView("Your Account", "Your Lists")
        }
    }

    private func button(_ text: String) -> some View {
        Button(text) {
            // custom action
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 44)
        .foregroundColor(.black)
        .background(Color(uiColor: .systemGray4))
        .cornerRadius(44)
    }

    private func buttonsView(_ text1: String,
                             _ text2: String
    ) -> some View {
        HStack(alignment: .center, spacing: 20) {
            button(text1)
            button(text2)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
