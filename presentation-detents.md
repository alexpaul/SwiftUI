# `presentationDetents`

![detents-gif](https://user-images.githubusercontent.com/1819208/200696976-b41b5f2d-577d-4ed7-9f5f-5a606c6110e0.gif)


try? it out 

```swift
import SwiftUI

struct ContainerView: View {
    var body: some View {
        Image("swift")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        VStack {
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Swift + SwiftUI 🤯")
                    .frame(minHeight: 44)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .bold()
            }
            .background(.blue)
            .cornerRadius(22)
            .padding(.horizontal, 20)
            .sheet(isPresented: $isPresented) {
                ContainerView()
                    // Apple docs: https://developer.apple.com/documentation/charts/chart/presentationdetents(_:)
                    .presentationDetents([
                        .fraction(0.8),
                        .large,
                        .medium
                    ])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

* [Apple docs: `presentationDetents`](https://developer.apple.com/documentation/charts/chart/presentationdetents(_:))
