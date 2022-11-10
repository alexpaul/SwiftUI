# Form

![Screen Shot 2022-11-10 at 11 36 51 AM](https://user-images.githubusercontent.com/1819208/201153994-d3636d17-eb81-49ba-8be3-64a088ae3e07.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Apple docs: https://developer.apple.com/documentation/swiftui/form
                Form {
                    Section {
                        Image("appleCard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    // Apple docs: https://developer.apple.com/documentation/swiftui/view/listrowinsets(_:)
                    .listRowInsets(EdgeInsets())
                    Section {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Card Balance")
                                .font(.headline)
                            Text("$0.00")
                                .font(.title)
                                .bold()
                            Text("10,000.00 Available")
                                .foregroundColor(.gray)
                        }
                        Button(action: {}) {
                            Text("Balance Details")
                        }
                    }
                    Section {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nothing to Pay")
                                .font(.title)
                                .bold()
                            Text("You have nothing to pay right now.")
                                .foregroundColor(.gray)
                        }
                    }
                    Section {
                        HStack(alignment: .top, spacing: 20) {
                            Image("clock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Set Up Scheduled Payments")
                                    .font(.headline)
                                    .bold()
                                Text("Never forget to make a payment by using Scheduled Payments.")
                                    .foregroundColor(.gray)
                            }
                        }
                        Button(action: {}) {
                            Text("Set Up Now")
                        }
                    }
                    // Apple docs: https://developer.apple.com/documentation/swiftui/list/listrowseparator(_:edges:)
                    .listRowSeparator(.visible)
                }
            }
            .navigationTitle("Apple Card")
            .navigationBarTitleDisplayMode(.inline)
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

* [Apple docs: `Form`](https://developer.apple.com/documentation/swiftui/form)
* [Apple docs: `listrowinsets(_:)`](https://developer.apple.com/documentation/swiftui/view/listrowinsets(_:))
* [Apple docs: `listrowseparator(_:edges:)`](https://developer.apple.com/documentation/swiftui/list/listrowseparator(_:edges:))
