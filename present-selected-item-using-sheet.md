# Using `sheet` to Present a selected item for a list

![Screen Shot 2023-01-08 at 7 25 49 PM](https://user-images.githubusercontent.com/1819208/211226388-038dfc8b-237f-43c6-bbfa-38c6fc0b5613.png)

try? it out

```swift
import SwiftUI

struct ContentView: View {
    private let movies = [
        "Glass Onion",
        "John Wick: Chapter 4",
        "The Super Mario Bros. Movie"
    ]

    // 1
    // Souce of truth must be an optional
    @State private var selectedMovie: String?

    var body: some View {
        List(movies, id: \.self) { movie in
            Text(movie)
                .onTapGesture {
                    // 2
                    // Update the selected movie
                    // This will casue SwiftUI to render a new View instance
                    // which will present a new `sheet` if the `selectedMovie`
                    // is different from the current selection of non-nil
                    selectedMovie = movie
                }
                // 3
                // Presents the View in the closure with the captured `movie` instance
                // Apple docs: `sheet(item:onDismiss:content:)`
                // https://developer.apple.com/documentation/swiftui/view/sheet(item:ondismiss:content:)
                .sheet(item: $selectedMovie) { movie in
                    Text(movie)
                        .presentationDetents([
                            .fraction(0.8),
                            .medium
                        ])
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 4
// Only used here since `sheet` expects the Bindable type to conform to `Identifiable`
// In an example where you're using a custom data type making sure to conform to
// `Identifiable` and returning a unique `id` will suffice
extension String: Identifiable {
    public var id: String { UUID().uuidString }
}
```

***

## Resources

* [Apple docs: `sheet(item:onDismiss:content:)`](https://developer.apple.com/documentation/swiftui/view/sheet(item:ondismiss:content:))
