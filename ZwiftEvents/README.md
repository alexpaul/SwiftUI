# Zwift Routes 

A SwiftUI app showcasing navigation and various SwiftUI Views including `LazyVGrid` and `AsyncImage`. 

```swift
import SwiftUI

struct ContentView: View {
    private let viewModel = EventViewModel()

    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.events, id: \.self) { event in
                        NavigationLink(destination: DetailView(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Zwift Routes")
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

![Screen Shot 2022-11-20 at 3 58 46 PM](https://user-images.githubusercontent.com/1819208/202925875-e68bdfbc-91f3-42aa-b109-070ccfbde385.png)

