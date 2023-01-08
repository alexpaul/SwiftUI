# Buttons Horizontally Centered 

![Screen Shot 2023-01-08 at 2 30 28 PM](https://user-images.githubusercontent.com/1819208/211215126-53f32a63-54b3-4d01-ad57-50eb4de2afe8.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    private let pets = ["Cat", "Goldfish", "Dog"]

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    ForEach(pets, id: \.self) { pet in
                        Button(action: {}) {
                            Text(pet)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding(.vertical, 5)
                                .background(.green)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(width: width * 0.75)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
