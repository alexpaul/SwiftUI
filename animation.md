# Animation 

## Search Animation 

![search-animation](https://user-images.githubusercontent.com/1819208/212469637-d1a91a6a-0760-4080-bd79-57d722e1337c.gif)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    // 1
    // "Source of truth" to be monitored for changes
    @State private var isAnimating = false

    let diameter: CGFloat = 20

    var body: some View {
        VStack {
            Circle()
                .frame(width: diameter, height: diameter)
                .foregroundColor(.blue)
                // 2
                // here we want to animate the `y` offset (up and down animation)
                .offset(y: isAnimating ? -80 : -10)
                // 3
                // animation call with `easeInOut` curve
                // also an animation `duration` is supplied along with `repeatForever`
                // `repeatForever` `autoreverses` param is set to `true` by default causing
                // the animation to reverse and continue indefinitely
                .animation(
                    .easeInOut(duration: 0.6).repeatForever(),
                    value: isAnimating
                )
            Text("Searching...")
        }
        .onAppear {
            // 4
            // starts on appearance of the `View`
            isAnimating = true
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
