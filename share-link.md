# Using `ShareLink`

![Screen Shot 2022-11-01 at 4 40 06 PM](https://user-images.githubusercontent.com/1819208/199336837-4185c13f-4a80-4eec-8839-a69155f1b037.png)


try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ShareLink(
                item: "https://www.youtube.com/watch?v=_Z3QKkl1WyM",
                subject: Text("Sent from Alex Paul"),
                message: Text("Check out this awesome trailer!"),
                preview: SharePreview(
                    "Black Panther: Wakanda Forever",
                    image: Image(systemName: "film")
                )
            ) {
                // You can pass a custom SwiftUI View instead of the default Share Icon
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "airplane.departure")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("Share")
                }
            }
            .font(.subheadline)
            .foregroundColor(.black)
            Spacer()
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

* [Apple docs: ShareLink](https://developer.apple.com/documentation/swiftui/sharelink)
