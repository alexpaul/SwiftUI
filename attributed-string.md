# `AttributedString`

## 1. Example 

Using `AttributedString`

![Screen Shot 2023-03-09 at 11 38 49 AM](https://user-images.githubusercontent.com/1819208/224091534-c6c523f2-c73e-4abb-98d3-bc1e6a862cbd.png)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    let headline = "Headline"
    let subheadline = "Subheadline"
    let cta = "Read more"

    var combinedSubheadline: AttributedString {
        var attrString = AttributedString(subheadline + " " + cta)
        if let range = attrString.range(of: cta) {
            attrString[range].underlineStyle = .single
            attrString[range].font = UIFont.preferredFont(forTextStyle: .headline)
        }
        return attrString
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(headline)
            Text(combinedSubheadline)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## 2. Example

Supporting Markdown in `AttributedString` 

![Screen Shot 2023-01-19 at 7 09 44 PM](https://user-images.githubusercontent.com/1819208/213589965-cff2bc51-dff8-4354-bbb5-ae8f9c8cf857.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            // 1
            // bold
            Text("**Name**: Alex Paul")
            Text("**Occupation**: Software Engineer")
            // 2
            // italic and links
            Text("_Learn more about me_ [here](https://www.alexpaul.dev)")
            // 3
            // strikethrough
            Text("~~copyright 2022~~")
                .font(.footnote)
            Text("copyright 2023")
                .font(.footnote)
        }
        .padding(40)
        .border(.gray, width: 2)
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

* [Apple docs: `AttributdString`](https://developer.apple.com/documentation/foundation/attributedstring)
