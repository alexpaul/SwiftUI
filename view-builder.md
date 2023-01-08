# ViewBuilder 

![Screen Shot 2023-01-08 at 6 23 24 AM](https://user-images.githubusercontent.com/1819208/211193505-b08af62d-319b-4c22-8122-fe1d79f91ecb.png)

try? it out

```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        load()
    }

    // 1
    // Experiment with removing `@ViewBuilder` from the function below
    // You will notice that you recieve the following compiler error:
    // Function declares an opaque return type 'some View', but the return statements in its body
    // do not have matching underlying types

    // 2
    // You can wrap the View's in `AnyView`
    // e.g `AnyView(Image(systemName: "exclamationmark.triangle.fill"))`
    // ..and use an explict `return AnyView(Image(systemName: "exclamationmark.triangle.fill"))`

    // 3
    // Or using the best practice approach of using a `ViewBuilder`
    // This is the similar approach that allows `View`s like `HStack` and `VStack` to 
    // compose multiple "types" of `View`s in SwiftUI

    @ViewBuilder func load() -> some View {
        let error = Bool.random()

        if error {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
        } else {
            Text("Loaded successfully")
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

* [Swift docs: Result Builders](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID630)
* [Apple docs: `ViewBuilder`](https://developer.apple.com/documentation/swiftui/viewbuilder)
* [Swift by Sundell: Adding SwiftUI’s ViewBuilder attribute to functions](https://www.swiftbysundell.com/tips/adding-swiftui-viewbuilder-to-functions/)
