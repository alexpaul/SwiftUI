# Using `ScrollViewReader` to "scroll to" a postion in a `ScrollView`


> Apple docs: A view that provides programmatic scrolling, by working with a proxy to scroll to known child views.

![Screen Shot 2023-02-15 at 9 23 02 PM](https://user-images.githubusercontent.com/1819208/219251693-a6f03cdc-c52c-4193-b78b-95550e21f7e9.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    private let numbers = Array(0...20)
    private let horizontalPadding: CGFloat = 10

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                HStack {
                    Button(action: {
                        withAnimation {
                            proxy.scrollTo(numbers[0])
                        }
                    }) {
                        Text("Start")
                    }
                    Spacer()
                    Button(action: {
                        withAnimation {
                            proxy.scrollTo(numbers.count / 2)
                        }
                    }) {
                        Text("Middle")
                    }
                    Spacer()
                    Button(action: {
                        withAnimation {
                            proxy.scrollTo(numbers.count - 1)
                        }
                    }) {
                        Text("End")
                    }
                }
                .padding(.horizontal, horizontalPadding)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(numbers.enumerated()), id: \.offset) { index, item in
                            Rectangle()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.teal)
                                .overlay {
                                    Text(item.description)
                                }
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                }
            }
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

## Resources 

* [Apple docs: `ScrollViewReader`](https://developer.apple.com/documentation/swiftui/scrollviewreader)
