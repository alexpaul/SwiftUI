# `AsyncImage`

> A view that asynchronously loads and displays an image.
> 
![Screen Shot 2023-01-21 at 7 18 54 PM](https://user-images.githubusercontent.com/1819208/213895078-2a2c53d4-9d2c-4fd0-a87b-50fad418fc75.png)


try? it out

```swift
import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var remoteConfigProvider = RemoteConfigurationProvider()

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Happy Lunar New Year")
                .font(.title)
            Text("Year of the Rabbit")
                .font(.title3)
            AsyncImage(
                url: URL(
                    string: "https://cdn11.bigcommerce.com/s-b7kra6t/product_images/uploaded_images/deskr1pnthbdnz7wk7ma5p7qah7g2dlqkkygd6fk.jpeg"
                )
            ) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
```

***

## Resources

* [Apple docs: `AsyncImage`](https://developer.apple.com/documentation/swiftui/asyncimage)
