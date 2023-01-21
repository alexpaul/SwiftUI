# AsyncImage

![Screen Shot 2023-01-21 at 5 38 18 PM](https://user-images.githubusercontent.com/1819208/213889771-5b10fc0d-5f37-4bde-9545-3db989a613dc.png)

try? it out

```swift
import SwiftUI

struct RemoteImageView: View {
    private let imageURL = "https://images.mypandit.com/myPandit_web/images/Content/Rabbit-astrology.jpg"

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
```
