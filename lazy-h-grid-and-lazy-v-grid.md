# `LazyHGrid` and `LazyVGrid`

![Screen Shot 2022-10-27 at 7 06 51 AM](https://user-images.githubusercontent.com/1819208/198268915-a3b7abb7-4c0a-4f5a-9748-0b1e60c6c8b0.png)

Try? it out.


```swift
import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.adaptive(minimum: 75)),
                   GridItem(.adaptive(minimum: 75)),
                   GridItem(.adaptive(minimum: 75))]

    let rows = [GridItem(.fixed(100))]

    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<50, id: \.self) { item in
                        HStack {
                            Text(item.description)
                        }
                        .frame(width: 100, height: 100)
                        .background(.orange)
                    }
                }
            }
            .frame(height: 200)
            .background(.yellow)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(50..<100, id: \.self) { item in
                        HStack {
                            Text(item.description)
                        }
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .bold()
                        .background(.red)
                        .cornerRadius(50)
                    }
                }
            }
            .frame(height: 200)
            .background(.yellow)
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(100..<150, id: \.self) { item in
                        HStack {
                            Text(item.description)
                        }
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .background(.teal)
                    }
                }
            }
            .background(.yellow)
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
