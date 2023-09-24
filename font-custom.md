# Adding a custom font 

> Design inspired by my son who attended his first App design workshop today 09/23/23. He specifically called out needing a pixelated font 😊.

![Screenshot 2023-09-23 at 7 30 19 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/b8b02b88-5a21-4d1f-ac95-7b6a6ecf4f67)

try? it out 

```swift
//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul
//

import SwiftUI

struct ContentView: View {
    let customFont = "Typeface-Mario-World-Pixel-Filled"

    var body: some View {
        VStack {
            Text("Mayhem")
                .font(Font.custom(customFont, size: 64))
            Text("Sandbox")
                .font(Font.custom(customFont, size: 24))
            Button(action: {}) {
                Text("Play")
                    .font(Font.custom(customFont, size: 18))
                    .padding()
                    .foregroundColor(.white)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
            )
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
* [Apple documentation: Applying custom fonts to text](https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text/)
* [Code with Chris: SwiftUI: How to add custom fonts to your app](https://codewithchris.com/swiftui/swiftui-custom-fonts/)
* [Font Space](https://www.fontspace.com/category/pixelated)
