# Handling Alerts

![Screen Shot 2023-02-14 at 6 20 24 AM](https://user-images.githubusercontent.com/1819208/218722366-042e38b0-de66-4cf6-a173-7a4157134166.png)


try? it out 

```swift
import SwiftUI

struct ContentView: View {
    @State private var statusCode = 0
    @State private var isShowingAlert = false
    @State private var isPresented = false

    var body: some View {
        VStack {
            Button(action: {
                statusCode = Self.networkStatusCode
                if statusCode > 202 {
                    isShowingAlert = true
                } else {
                    isPresented = true
                }
            }) {
                Text("Submit Request")
            }
            .alert("Network Error\n Status Code: \(statusCode)",
                   isPresented: $isShowingAlert) {
                Button("Ok", role: .cancel) {}
            }
            .sheet(isPresented: $isPresented) {
                Text("Successful Request")
            }
        }
    }

    private static var networkStatusCode: Int {
        [200, 201, 202, 404, 500].randomElement() ?? 400
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

* [Apple docs: `alert(_:isPresented:presenting:actions:message:)`](https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l)
