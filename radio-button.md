# Radio Button 

![Screen Shot 2023-01-27 at 7 11 51 PM](https://user-images.githubusercontent.com/1819208/215228776-c7a87e88-679e-4d19-9f28-ba87217895fb.png)

try? it out 

```swift
import SwiftUI

struct RadioButton: View {
    @State private var isSelected = false

    private let outerCircleDiameter: CGFloat = 60
    private let innerCircleDiameter: CGFloat = 44

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Circle()
                .strokeBorder(.gray, lineWidth: 2)
                .background(
                    Circle()
                        .frame(width: innerCircleDiameter, height: innerCircleDiameter)
                        .foregroundColor(isSelected ? .blue : .clear)
                )
                .frame(width: outerCircleDiameter, height: outerCircleDiameter)
        }
    }
}

struct ContentView: View {
    var body: some View {
        RadioButton()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
