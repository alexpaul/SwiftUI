# Be mine SwiftUI

![Screen Shot 2023-02-14 at 4 00 29 PM](https://user-images.githubusercontent.com/1819208/218862460-54cb0175-8b49-46c9-bf0d-73a347954acc.png)

try? it out 

```swift
import SwiftUI

struct RatingView: View {
    let stars = 5
    let fixedStars = Array(0...4)
    var body: some View {
        VStack {
            Text("SwiftUI can you be my Valentine?")
                .padding()
            HStack {
                ForEach(Array(fixedStars.enumerated()),
                        id: \.offset) { index, element in
                    Image(systemName: index < stars ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
```
