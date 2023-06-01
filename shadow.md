# `.shadow`

![Screenshot 2023-06-01 at 7 22 29 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/804c6389-59a9-433a-aad1-fc40541c7ac1)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("wakanda")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
            Spacer()
            HStack {
                Spacer()
                Text("miles phan")
                    .font(.caption2)
                    .italic()
                    .foregroundColor(.gray)
            }
            .padding([.trailing, .bottom], 16)
        }
        .frame(height: 600)
        .frame(maxWidth: .infinity)
        .background(.white)
        .padding(.horizontal, 20)
        .shadow(color: .gray.opacity(0.5), radius: 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
