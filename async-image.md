# `AsyncImage`

> A view that asynchronously loads and displays an image.

![Screen Shot 2023-01-21 at 7 19 59 PM](https://user-images.githubusercontent.com/1819208/213895100-e628e7b9-c540-4db4-955f-cd216f902055.png)


try? it out

```swift
import SwiftUI

struct RemoteImageView: View {
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
