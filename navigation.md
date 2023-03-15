# Navigation

## Example 1

![Screen Shot 2023-03-14 at 8 40 33 PM](https://user-images.githubusercontent.com/1819208/225174194-5123f8e8-24a0-4ea4-af9f-22f742a7f559.png)

try? it out 

```swift
import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Detail View")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Show detail view") {
                DetailView()
            }
            .navigationTitle("Home View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
