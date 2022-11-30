# `List`

<img width="1359" alt="Screen Shot 2022-11-29 at 6 19 23 PM" src="https://user-images.githubusercontent.com/1819208/204669819-2e1ac049-6104-4882-80ee-e2e5f827b9ac.png">

1. First Section is a horizontal list.
2. Items are embedded in an `HStack` to make it a horizontal list. 
3. The second `Section` is a vertical list.
4. There are a varity of `List` Styles which includes: `automatic`, `grouped` and `plain`. 
5. To hide the scroll indicators we set `scrollIndicators` to `hidden`. 

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
        // 4
        // some other list styles are: grouped, automatic, plain
        .listStyle(.insetGrouped)
        // 5
        .scrollIndicators(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
