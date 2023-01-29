# Radio Button 

![Screen Shot 2023-01-27 at 7 11 51 PM](https://user-images.githubusercontent.com/1819208/215228776-c7a87e88-679e-4d19-9f28-ba87217895fb.png)

try? it out 

```swift
import SwiftUI

struct RadioButton: View {
    var outerDiameter: CGFloat = 24 // default value
    var innerDiameter: CGFloat = 14 // default value

    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Circle()
                .strokeBorder(isSelected ? .blue : .gray, lineWidth: 2)
                .background(
                    Circle()
                        .frame(width: innerDiameter, height: innerDiameter)
                        .foregroundColor(isSelected ? .blue : .clear)
                )
                .frame(width: outerDiameter, height: outerDiameter)
        }
    }
}

struct ContentView: View {
    var body: some View {
        RadioButton(outerDiameter: 60, innerDiameter: 44)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
