# Button 

![Screen Shot 2022-11-01 at 8 31 57 PM](https://user-images.githubusercontent.com/1819208/199367102-40b19ad9-823d-499a-9372-051d544f262e.png)


```swift
import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let segmentedBorderHeight: Double = 1
        static let buttonHeight: Double = 44
    }

    @State private var isSelected = 0

    var body: some View {
        Button(action: performAction) {
            Text("Press for SwiftUI")
                .frame(minHeight: 44)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .bold()
        }
        .background(.blue)
        .cornerRadius(22)
        .padding(.horizontal, 20)
    }

    private func performAction() {
        print("Button Pressed")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources

* [Apple docs: Button](https://developer.apple.com/documentation/swiftui/button)
