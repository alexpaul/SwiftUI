# `List`

<img width="1353" alt="Screen Shot 2022-11-29 at 6 13 16 PM" src="https://user-images.githubusercontent.com/1819208/204669127-29b1a9b8-ecde-4f6f-9a37-23eea526d921.png">

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            // 1
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    // 2
                    HStack {
                        ForEach(1..<51) { item in
                            Text(item.description)
                        }
                    }
                }
            }
            // 3
            Section {
                ForEach(1..<21) { item in
                    Text(item.description)
                }
            }
        }
        // 3
        // some other list styles are: grouped, automatic, plain
        .listStyle(.insetGrouped)
        // 4
        .scrollIndicators(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
