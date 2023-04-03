# Chevron Rotation 

https://user-images.githubusercontent.com/1819208/229583899-046c3c02-b2c2-4db4-80f7-3e9e5fdfe60b.mp4

```swift
import SwiftUI

struct ContentView: View {
    @State private var isToggled = false

    var body: some View {
        Image(systemName: "chevron.down")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .aspectRatio(contentMode: .fill)
            .rotationEffect(isToggled ? Angle(degrees: -180) : Angle(degrees: 0))
            .animation(.linear, value: isToggled)
            .onTapGesture {
                isToggled.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
