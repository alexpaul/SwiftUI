# Auto Scroll a SwiftUI ScrollView

![scroll](https://user-images.githubusercontent.com/1819208/200452458-d542f836-7d7c-44c7-b001-560063a363eb.gif)

try? it out

```swift
import SwiftUI

struct Language: Identifiable, Hashable {
    let name: String
    let image: String
    var id = UUID()
}

struct ContentView: View {
    private let languages: [Language] = [
        .init(name: "C++", image: "c-plus-plus"),
        .init(name: "C", image: "c"),
        .init(name: "PHP", image: "php"),
        .init(name: "Perl", image: "perl"),
        .init(name: "Objective-C", image: "objective-c"),
        .init(name: "Swift", image: "swift"),
        .init(name: "JavaScript", image: "javascript"),
        .init(name: "HTML", image: "html"),
        .init(name: "CSS", image: "css"),
    ]

    @State private var selectedIndex = 0

    private let rows: [GridItem] = [
        GridItem(.fixed(300))
    ]

    private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        // Apple docs:
        // https://developer.apple.com/documentation/swiftui/scrollviewreader
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 0) {
                    ForEach(languages, id:\.self) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(maxHeight: .infinity)
                        .frame(width: 300)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 20)
                    }
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(languages[selectedIndex])
                        }
                    }
                    .onReceive(timer) { _ in
                        withAnimation {
                            if selectedIndex < languages.count - 1 {
                                selectedIndex += 1
                                proxy.scrollTo(languages[selectedIndex])
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: 400)
            .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
