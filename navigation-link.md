# Navigation Link 

<img width="1280" alt="Screenshot 2023-08-16 at 1 01 16 PM" src="https://github.com/alexpaul/SwiftUI/assets/1819208/897038cd-1e2f-4608-9426-e221f4b659b4">

try? it out

```swift
import SwiftUI

struct CustomView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .frame(height: 80)
            .overlay {
                Text("Navigate to detail page")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    Text("Detail Page")
                } label: {
                    CustomView()
                }
            }
            .navigationTitle("Navigation Link")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
