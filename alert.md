# Handling Alerts

![Screen Shot 2023-02-14 at 6 15 34 AM](https://user-images.githubusercontent.com/1819208/218721443-9a022b2d-6d4e-4f26-9461-452665272d5a.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    @State private var errorCode = 0
    @State private var isShowingAlert = false
    @State private var isPresented = false

    var body: some View {
        VStack {
            Button(action: {
                errorCode = Self.randomErrorCode
                if errorCode > 202 {
                    isShowingAlert = true
                } else {
                    isPresented = true
                }
            }) {
                Text("Submit Request")
            }
            .alert("Network Error\n Status Code: \(errorCode)",
                   isPresented: $isShowingAlert) {
                Button("Ok", role: .cancel) {}
            }
            .sheet(isPresented: $isPresented) {
                Text("Successful Request")
            }
        }
    }

    private static var randomErrorCode: Int {
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
