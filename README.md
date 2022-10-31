# SwiftUI

A Repo for SwiftUI Sample Code

![Screen Shot 2022-10-31 at 1 41 10 PM](https://user-images.githubusercontent.com/1819208/199073709-5de1df03-9e64-44c4-8784-cfe6f9177dca.png)


```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Image("swiftui-logo")
            Text("SwiftUI")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
